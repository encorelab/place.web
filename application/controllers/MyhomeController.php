<?php

class MyhomeController extends Zend_Controller_Action
{

    public function init()
    {

    }

    public function indexAction()
    {
    	// calculate tagging and voting scores
    	
    	
        
    }

    public function preferencesAction()
    {
        
    }
    
    public function classlistAction()
    {
        $this->view->students = Doctrine::getTable("User")->findByDql("user_type = 'STUDENT' AND run_id = ".$_SESSION["run_id"]);
    }
}

