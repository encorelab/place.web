<?php

class MyhomeController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
    	global $PLACEWEB_CONFIG;
	// pass $PLACEWEB_CONFIG to the view
        $this->view->PLACEWEB_CONFIG = $PLACEWEB_CONFIG;

    	// disableLayout
    	//$this->_helper->layout()->disableLayout();

	// get the activities data here ... a bit of redundancy... 
	// since this stuff is already in another controller ... 
	// anyways...

	$q = Doctrine_Query::create()
	->select('e.*')
	->from('Activity e')
	->where('e.run_id = ?', $_SESSION['run_id'])
	->orderBy('e.id DESC');
	$activities = $q->fetchArray();		


	// pass $activities to the view
        $this->view->activities = $activities;

    	// disableLayout
    	//$this->_helper->layout()->disableLayout();


	//$classActivity = 
    }

    public function preferencesAction()
    {
        // action body


    	// disableLayout
    	//$this->_helper->layout()->disableLayout();
  	
    }
    
    public function classlistAction()
    {
        // action body


    	// disableLayout
    	//$this->_helper->layout()->disableLayout();
  	
    }
}

