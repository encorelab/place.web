<?php
require(APPLICATION_PATH.'/models/ajaxfileuploader/upload.php');

class AjaxController extends Zend_Controller_Action
{
    //$_SESSION is not available in classactivityAction() ??
    private $session;

    public function init()
    {
        $this->_helper->layout()->disableLayout();
    }
    
    public function myupdatesAction()
    {
        $q = Doctrine_Query::create()
    	->select('e.*')
    	->from('Activity e')
    	->where('e.run_id = ?' , $_SESSION['run_id'])
    	->andWhere('e.activity_on_user = ?', $_SESSION['author_id'])
        ->andWhere('e.author_id != ?', $_SESSION['author_id'])
    	->orderBy('e.id DESC');

    	$activities = $q->execute();		
        
        $this->view->activities = $activities;
    }

    public function myactivityAction()
    {
    	$q = Doctrine_Query::create()
    	->select('e.*')
    	->from('Activity e')
    	->where('e.run_id = ?' , $_SESSION['run_id'])
    	->andWhere('e.author_id = ?', $_SESSION['author_id'])
    	->orderBy('e.id DESC');
    	
    	$activities = $q->execute();
    	
        $this->view->activities = $activities;
    }

    public function classactivityAction()
    {
        $q = Doctrine_Query::create()
    	->select('e.*')
    	->from('Activity e')
    	->where('e.run_id = ?' , $_SESSION['run_id'])
    	->andWhere('e.activity_on_user != ?', $_SESSION['author_id'])
        ->andWhere('e.author_id != ?', $_SESSION['author_id'])
    	->orderBy('e.id DESC');
    	
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
                    // ->andWhere("q.is_published = 1")
                    // ->andWhere("q.is_public = 1")
                    ->orderBy("q.date_created desc")
                    ->execute();
                
        // $q =         Doctrine_Query::create()
        //                     ->select("q.id")
        //                     ->from("Question q")
        //                     ->where("q.run_id = ?", $_SESSION['run_id'])
        //                     ->andWhere("q.id NOT IN (select answer.question_id from answer where answer.author_id = ".$_SESSION['author_id'].")")
        //                     // ->andWhere("q.is_published = 1")
        //                     // ->andWhere("q.is_public = 1")
        //                     ->orderBy("q.date_created desc");
        //                     echo $q->getSqlQuery();die();
        $unansweredQuestions = Doctrine_Query::create()
                    ->select("q.*")
                    ->from("Question q")
                    ->where("q.run_id = ?", $_SESSION['run_id'])
                    ->andWhere("q.id NOT IN (select answer.question_id from answer where answer.author_id = ".$_SESSION['author_id'].")")
                    // ->andWhere("q.is_published = 1")
                    // ->andWhere("q.is_public = 1")
                    ->orderBy("q.date_created desc")
                    ->execute();
                    
        $this->view->answeredQuestions = $answeredQuestions;
        $this->view->unansweredQuestions = $unansweredQuestions;
    }

    public function uploadfileAction()
    {
	global $PLACEWEB_CONFIG;
	$this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer->setNoRender();	

	$upload_handler = new UploadHandler();
	ob_end_clean();


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

///*
    	$this->getResponse()    	
	->setHeader('Pragma: no-cache')
    	->setHeader('Cache-Control: private, no-cache')
    	->setHeader('Content-Disposition: inline; filename="files.json"')
    	->setHeader('X-Content-Type-Options: nosniff')
	->setHeader('Content-Type', 'text/plain')
    	    ->appendBody($content)
    	->sendResponse(); 
	
	ob_end_clean();
    		
    	
//*/
    }
}

