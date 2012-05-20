<?php
class SmartroomController extends Zend_Controller_Action
{

    public function indexAction()
    {
    	$params = $this->getRequest()->getParams();
    	if(isset($params['problem_id']))
		{
			//echo "<hr>".$params;
			$this->savehomework($totProblems);
		}
        $this->loadcurrenthk();
        $this->loadassets();
        
    }
    
    public function loadassets()
    {
    	global $PLACEWEB_CONFIG;
    	$problems = file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/problems.json');
    	$problems_array = json_decode($problems, true);
    	
    	$equations = file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/equations.json');
    	$equations_array = json_decode($equations, true);
    	
    	$this->view->problems=$problems_array;
    	$this->view->equations=$equations_array;
    	$this->view->assetsURL=$PLACEWEB_CONFIG['assetsURL'];
    }
    
    public function savehomework()
    {
    
    	global $PLACEWEB_CONFIG;
		
    	$params = $this->getRequest()->getParams();
    	
		$problem = new SmartroomHw();
		$problem->problem_id = $params['problem_id'];
		$problem->problem_name= $params['problem_name'];
		$problem->username = $_SESSION['username'];
		$problem->principles=$params['principles'];
		$problem->equations =$params['equations'];
		$problem->save();

		header('Location: /Smartroom');
    }
    
    
    public function loadcurrenthk()
    {
        global $PLACEWEB_CONFIG;
         
        if($_SESSION['hwgroup']==1)
        {
         	$activeProblem = 0;	
        } else {
        	$activeProblem = 15;
        }
		$totProblems=0;
		$hwIsFinished= 0;
    	
		$q = Doctrine_Query::create()
		->select('hw.*')
		->from('SmartroomHw hw')
		->where('hw.username = ?' ,$_SESSION['username'])
		->orderBy('hw.problem_id DESC');

		$homework = $q->fetchArray();
		
		if (isset($homework[0]['problem_id'])) {
			$totProblems = count($homework);
		}		

		if (isset($homework[0]['problem_id']) && count($homework)==15) {
			// homework is finished
			$hwIsFinished = 1;
	   	} else if (isset($homework[0]['problem_id'])) {
			// go the next question
	   		$activeProblem = $homework[0]['problem_id']+1;
		}
 	
		$this->view->homework=$homework;
		$this->view->activeProblem=$activeProblem;
		$this->view->hwIsFinished=$hwIsFinished;
		$this->view->totProblems=$totProblems;
	
    } // end loadcurrenthk()
    
} // end class

