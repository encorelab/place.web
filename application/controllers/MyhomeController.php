<?php

class MyhomeController extends Zend_Controller_Action
{

    public function init()
    {

    }

    public function indexAction()
    {
        
    }

    public function preferencesAction()
    {
        
    }
    
    public function classlistAction()
    {
        $this->view->students = Doctrine::getTable("User")->findByDql("user_type = 'STUDENT'");
    }
}

