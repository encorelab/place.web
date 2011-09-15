<?php

class UserController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {

    }
    
    public function addAction()
    {

    }

    public function changepasswordAction()
    {

    }
    
    public function loginAction()
    {
    	
    	$rollCall=false;
    	//$rollCall=true;
    	
    	if($rollCall)
    	{
    		
    		// do roll call authentication here 
    	} else {
    	
    		// authenricate against local db
    	}

    }
    
    public function logoutAction()
    {

    }
    
}

