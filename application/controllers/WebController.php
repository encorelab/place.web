<?php

class WebController extends Zend_Controller_Action
{
    public function init()
    {
		Placeweb_Authorizer::authorize();
	}

    public function indexAction()
    {
    }
    
 
    public function addAction()
	{
    }


}

