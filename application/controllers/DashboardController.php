<?php

class DashboardController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }
    
    public function showAction(){
        $users = Doctrine::getTable("Users")->findAll(Doctrine::HYDRATE_ARRAY);
        
        $this->view->myUsers = $users;
    }
    
    public function addexampleAction(){
        $params = $this->getRequest()->getParams();
        
        $example = new Examples();
        $example->run_id = 1;
        $example->author_id = 3;
        $example->name = $params['example_name'];
        $example->content = "My example content";
        $example->save();
        
        
        $this->view->newExample = $example;
    }


}

