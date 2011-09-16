<?php
require(APPLICATION_PATH.'/models/ajaxfileuploader/upload.php');

class AjaxController extends Zend_Controller_Action
{
    //$_SESSION is not available in classactivityAction() ??
    private $session;

    public function init()
    {
	$this->session=$_SESSION;
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        
    	
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
  	
    }

    public function testAction()
    {
    	global $PLACEWEB_CONFIG;

    	// disableLayout
    	$this->_helper->layout()->disableLayout();

    	//echo '<h1>$_SESSION</h1>';
    	//print_r($_SESSION);

    	//echo '<h1>$PLACEWEB_CONFIG</h1>';
    	//print_r($PLACEWEB_CONFIG);

	// pass $PLACEWEB_CONFIG to the view
        $this->view->PLACEWEB_CONFIG = $PLACEWEB_CONFIG;

	// pass test data to the view
        $this->view->testData = "<p>this is a test string passed to to the view.</p>";

    }
    
    public function myupdatesAction()
    {
    	global $PLACEWEB_CONFIG;

	//print_r($PLACEWEB_CONFIG);
	//print_r($_SESSION);

	$q = Doctrine_Query::create()
	->select('e.*')
	->from('Activity e')
	->where('e.run_id = ? AND e.author_id = ?' , array($_SESSION['run_id'], $_SESSION['author_id']))
	->orderBy('e.id DESC');

	$activities = $q->fetchArray();		
        
        $this->view->activities = $activities;

	// pass $PLACEWEB_CONFIG to the view
        $this->view->PLACEWEB_CONFIG = $PLACEWEB_CONFIG;

    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    }

    public function myactivityAction()
    {
    	global $PLACEWEB_CONFIG;

	//print_r($PLACEWEB_CONFIG);
	//print_r($_SESSION);

	$q = Doctrine_Query::create()
	->select('e.*')
	->from('Activity e')
	->where('e.run_id = ? AND e.activity_on_user = ?' , array($_SESSION['run_id'], $_SESSION['author_id']))
	->orderBy('e.id DESC');
	$activities = $q->fetchArray();		
        
        $this->view->activities = $activities;

	// pass $PLACEWEB_CONFIG to the view
        $this->view->PLACEWEB_CONFIG = $PLACEWEB_CONFIG;

    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    }

    public function classactivityAction()
    {

	// include $_SESSION file: this is needed when loading this action thrhough 
	// file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/ajax/classactivity');

	require_once(APPLICATION_PATH.'/configs/config.php');
//	require_once(APPLICATION_PATH.'/layouts/include/'.'security.inc.php');
    	
	global $PLACEWEB_CONFIG;


	//print_r($PLACEWEB_CONFIG);
	//print_r($_SESSION);
	//print_r($this->session);

	$q = Doctrine_Query::create()
	->select('e.*')
	->from('Activity e')
//	->where('e.run_id = ?', $_SESSION['run_id']) // an error here !!
	->orderBy('e.id DESC');
	$activities = $q->fetchArray();		

	// pass $PLACEWEB_CONFIG to the view
        $this->view->PLACEWEB_CONFIG = $PLACEWEB_CONFIG;

	// pass $activities to the view
        $this->view->activities = $activities;

    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    }

    public function uploadfile1Action()
    {
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    } // end uploadfile


    public function uploadfileAction()
    {
	global $PLACEWEB_CONFIG;

	//print_r($PLACEWEB_CONFIG);

    	// disableLayout
    	$this->_helper->layout()->disableLayout();
	//$this->view->PLACEWEB_CONFIG = $PLACEWEB_CONFIG;;

//echo $_SERVER['REQUEST_METHOD'];



	$upload_handler = new UploadHandler();
/*
	header('Pragma: no-cache');
	header('Cache-Control: private, no-cache');
	header('Content-Disposition: inline; filename="files.json"');
	header('X-Content-Type-Options: nosniff');
*/

	ob_start();
echo $_SERVER['REQUEST_METHOD'];
	switch ($_SERVER['REQUEST_METHOD']) {
	    case 'HEAD':
	    case 'GET':
		$upload_handler->get();
		break;
	    case 'POST':
		//echo "<hr>hello Mike";
		$upload_handler->post();
		break;
	    case 'DELETE':
		$upload_handler->delete();
		break;
	    default:
		//header('HTTP/1.0 405 Method Not Allowed');
	}echo 'yo@';
	$content = ob_get_contents();
	ob_end_clean();

///*
	$this->getResponse()

	    ->setHeader('Content-Type', 'text/plain')

	    ->appendBody($content)
		->sendResponse(); exit(0);

	




//*/

    	
    } // end uploadfile
    
}

