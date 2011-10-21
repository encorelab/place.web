<?php
require(APPLICATION_PATH.'/models/ajaxfileuploader/upload.php');

class AjaxController extends Zend_Controller_Action
{
    private $session;

    public function init()
    {
        $this->_helper->layout()->disableLayout();
    }
    
    public function studentProfileAction()
    {
        $params = $this->getRequest()->getParams();
        
        $this->view->activities = Doctrine::getTable("Activity")
                                    ->findByDql("author_id = ?", $params['studentId']);
    }

	public function studentScoreCardAction(){
		$params = $this->getRequest()->getParams();
		
		$studentId = $params['studentId'];
		$student = Doctrine::getTable('User')->find($studentId);
		
		$this->view->lastLogin = $student['last_login'];
				
		$this->view->numExamples = count(Doctrine::getTable('Example')->findByAuthorId($studentId));
		$this->view->numAnswers = count(Doctrine::getTable('Answer')->findByAuthorId($studentId));
		$this->view->numComments = count(Doctrine::getTable('Comment')->findByAuthorId($studentId));
		$this->view->numVotes = count(Doctrine::getTable('Vote')->findByAuthorId($studentId));
		$this->view->numUpVotes = count(Doctrine::getTable('Vote')->findByDql("author_id = ? AND vote_value > 0", $studentId));
		$this->view->numDownVotes = count(Doctrine::getTable('Vote')->findByDql("author_id = ? AND vote_value < 0", $studentId));
		// $this->view->numCommentsAssessed = 
		// $q = new Doctrine_RawSql();
		//     	$q	->select('*')
		//         	->from('Comment c')
		// 		->leftJoin('c.Assessment a ON c.id = a.obj_id')
		// 		
		// 		
		//         	->addComponent('a', 'Activity a')
		//         	->where('a.run_id = ?' , $_SESSION['run_id'])
		//         	->andWhere('a.author_id = ?', $_SESSION['author_id'])
		//         	->andWhere('a.id NOT IN (select r.activity_id from resolved_user_alert r where r.author_id = '
		// 						.$_SESSION['author_id'].' AND run_id = '.$_SESSION['run_id'].')')
		//         	->orderBy('a.id DESC');
		
		
		$this->view->commentScore = Vote::calculateCommentScore($studentId);
		
		list($tagExampleScore, $tagQuestionScore, $tagScoreTot) = Vote::calculateTagScore($studentId);
		$this->view->tagExampleScore = $tagExampleScore;
		$this->view->tagQuestionScore = $tagQuestionScore;
		$this->view->tagScore = $tagScoreTot;
	}
    
    public function resolveAlertAction()
    {
        $params = $this->getRequest()->getParams();
        $activityId = $params['activityId'];
        
        $resolver = new ResolvedUserAlert();
        $resolver->run_id = $_SESSION['run_id'];
        $resolver->author_id = $_SESSION['author_id'];
        $resolver->date_created = date( 'Y-m-d H:i:s');
        $resolver->activity_id = $activityId;
        $resolver->response = 'ok';        
        $resolver->save();
        
        $this->_helper->viewRenderer->setNoRender();
        echo "ok";
    }
    
    public function myupdatesAction()
    {
		$params = $this->getRequest()->getParams();
		
        $q = new Doctrine_RawSql();
        $q
        	->select('{a.*}')
        	->from('Activity a')
        	->addComponent('a', 'Activity a')
        	->where('a.run_id = ?' , $_SESSION['run_id'])
        	->andWhere('a.activity_on_user = ?', $_SESSION['author_id'])
            ->andWhere('a.author_id != ?', $_SESSION['author_id'])
            ->andWhere('a.id NOT IN (select r.activity_id from resolved_user_alert r where r.author_id = '
							.$_SESSION['author_id'].' AND run_id = '.$_SESSION['run_id'].')')
        	->orderBy('a.id DESC');
		
		if (isset($params['limit'])){
			$q->limit($params['limit']);
			$this->view->limit = $params['limit'];
		}
		
    	$activities = $q->execute();		
        
        $this->view->activities = $activities;
    }

    public function myactivityAction()
    {
		$params = $this->getRequest()->getParams();
		
        $q = new Doctrine_RawSql();
    	$q	->select('{a.*}')
        	->from('Activity a')
        	->addComponent('a', 'Activity a')
        	->where('a.run_id = ?' , $_SESSION['run_id'])
        	->andWhere('a.author_id = ?', $_SESSION['author_id'])
        	->andWhere('a.id NOT IN (select r.activity_id from resolved_user_alert r where r.author_id = '
							.$_SESSION['author_id'].' AND run_id = '.$_SESSION['run_id'].')')
        	->orderBy('a.id DESC');
    	
		if (isset($params['limit'])){
			$q->limit($params['limit']);
			$this->view->limit = $params['limit'];
		}

    	$activities = $q->execute();
    	
        $this->view->activities = $activities;
    }

    public function classactivityAction()
    {
		$params = $this->getRequest()->getParams();
		
		$studentRepressedActivityTypes = array(
			ActivityType::$ASSESSED_COMMENT, 
			ActivityType::$ASSESSED_EXAMPLE, 
			ActivityType::$ASSESSED_ANSWER,
			ActivityType::$CREATED_QUESTION,
			ActivityType::$ANSWERED_QUESTION
		);
		
        $q = new Doctrine_RawSql();
        $q	->select('{a.*}')
        	->from('Activity a')
        	->addComponent('a', 'Activity a')
        	->where('a.run_id = ?' , $_SESSION['run_id'])
        	->andWhere('(a.activity_on_user != ? OR a.activity_on_user is null)', $_SESSION['author_id'])
            ->andWhere('a.author_id != ?', $_SESSION['author_id'])
            ->andWhere('a.id NOT IN (select r.activity_id from resolved_user_alert r where r.author_id = '
							.$_SESSION['author_id'].' AND run_id = '.$_SESSION['run_id'].')')
        	->orderBy('a.id DESC');
    	
		if ($_SESSION['profile'] == 'STUDENT'){
			$q->andWhereNotIn('a.activity_type_id', $studentRepressedActivityTypes);
		}

		if (isset($params['limit'])){
			$q->limit($params['limit']);
			$this->view->limit = $params['limit'];
		}
			
    	$activities = $q->execute();
    	
        $this->view->activities = $activities;
    }
    
    public function myhomeworkAction(){
        $answeredQuestions = Doctrine_Query::create()
                    ->select("q.*, a.*")
                    ->from("Question q")
                    ->innerJoin("q.Answer a")
                    ->where("q.run_id = ?", $_SESSION['run_id'])
                    ->andWhere("a.author_id = ?", $_SESSION['author_id'])
                    ->andWhere("q.is_published = 1")
                    ->orderBy("q.date_created desc")
                    ->execute();
    
        $q = new Doctrine_RawSql();
        $q  ->select('{q.*}')
            ->from("question q")
            ->addComponent('q', 'Question q')
            ->where("q.run_id = ?", $_SESSION['run_id'])
            ->andWhere("q.id NOT IN (select a.question_id from answer a where a.author_id = ".$_SESSION['author_id'].")")
            ->andWhere("q.is_published = 1")         
            ->orderBy("q.date_created desc");
            
        $unansweredQuestions = $q->execute();
        
        $this->view->answeredQuestions = $answeredQuestions;
        $this->view->unansweredQuestions = $unansweredQuestions;
    }

    public function uploadfileAction()
    {
	global $PLACEWEB_CONFIG;
    	$this->_helper->layout->disableLayout();
    	$this->_helper->viewRenderer->setNoRender();	
    	$upload_handler = new UploadHandler();
    	//ob_end_clean();


	ob_start();
    	switch ($_SERVER['REQUEST_METHOD']) {
    	    case 'HEAD':
    	    case 'GET':
    		    $upload_handler->get();
    		    break;
    	    case 'POST':
    		    $upload_handler->post();
    		    break;
    	    case 'DELETE':
    		    $upload_handler->delete();
    		    break;
    	    default:
		$this->getResponse()    	
		->setHeader('HTTP/1.0 405 Method Not Allowed')
		->sendResponse();
    		return;	  
    	}
   		
    	$content = ob_get_contents();
    	ob_end_clean();
	
    	$this->getResponse()->clearAllHeaders()    	
    	->setHeader('Pragma', 'no-cache', true)
        	->setHeader('Cache-Control', 'private, no-cache', true)
        	//->setHeader('Content-Disposition', 'inline; filename="files.json"', true)
        	->setHeader('X-Content-Type-Options', 'nosniff', true)
    	->setHeader('Content-Type', 'text/plain', true)
        	    ->appendBody($content)
        	->sendResponse(); 
	exit(0);
    //	ob_end_clean();
    }
}

