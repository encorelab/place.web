<?php

class AjaxController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        
    	print_r($_SESSION);
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
  	
    }

    public function testAction()
    {
    	print_r($_SESSION);
    }
    
    public function test_action()
    {
    	echo "<hr>Hola Anto, this is test_action in Ajax Controller";
    }
        
    public function myupdatesAction()
    {
        // action body

    	//print_r($_SESSION);
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    	// get the data here 
    	
    	// return it as a view
    	$this->view->myUpdates = "printing my updates";
    }

    public function myactivityAction()
    {
        // action body

    	//print_r($_SESSION);
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    	// get the data here 
    	
    	// return it as a view
    	$this->view->myUpdates = "printing my updates";
    }

    public function classactivityAction()
    {
    	global $PLACEWEB_CONFIG, $_SESSION;
    	
    	// need some filters here
    		//$activities = Doctrine::getTable("Activities")->findAll(Doctrine::HYDRATE_ARRAY);
    	
    	///*
		$q = Doctrine_Query::create()
		->select('e.*')
		->from('Activities e')
//		->where('e.run_id = ?', $_SESSION['run_id'])
		->orderBy('e.id DESC');
		$activities = $q->fetchArray();
		//*/ 
		
        
        $this->view->activities = $activities;
        // action body

    	//print_r($PLACEWEB_CONFIG);
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    	// get the data here 
    	
    	// return it as a view
    	//$this->view->myUpdates = "printing my updates";
    }

    public function uploadfileAction()
    {
        // action body

    	//print_r($_SESSION);
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    	// get the data here 
    	
    	// return it as a view
    	//$this->view->myresults = "printing my updates";
    }
    
}

