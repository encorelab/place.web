<?php

class WebController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }
    
 
    public function addAction(){
        $params = $this->getRequest()->getParams();
        
        //if($params['saved'])
        
        echo "Params: <hr/>";
        print_r($params);
        echo "<hr/>";
    }


}

