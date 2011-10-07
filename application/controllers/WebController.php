<?php

class WebController extends Zend_Controller_Action
{
    private $d3Data;
    private $conceptIds = array();  
    private $params;

    public function init()
    {
        Placeweb_Authorizer::authorize();
    }

    public function indexAction()
    {
    	
    	$this->_helper->layout()->disableLayout();
    	
		$this->params = $this->getRequest()->getParams();
		
		// set default viz
		if(!isset($this->params['vizType']))
		{
			$this->view->vizType = 2;
		}
		
		if(isset($this->params['vizType']) && $this->params['vizType']==1)
		{
			$this->view->vizType = 1;
		} else if(isset($this->params['vizType']) && $this->params['vizType']==2) {
			$this->view->vizType = 2;
		}

    	if(isset($this->params['vizEx']) && $this->params['vizEx']==1)
		{
			$this->view->vizEx = 1;
		} else {
			$this->view->vizEx = 0;
		}

        if(isset($this->params['vizQu']) && $this->params['vizQu']==1)
		{
			$this->view->vizQu = 1;
		} else {
			$this->view->vizQu = 0;
		}
		
        if(isset($this->params['vizMy']) && $this->params['vizMy']==1)
		{
			$this->view->vizMy = 1;
		} else {
			$this->view->vizMy = 0;
		}
		
        if(isset($this->params['vizCon']) && $this->params['vizCon']==1)
		{
			$this->view->vizCon = 1;
		} else {
			$this->view->vizCon = 0;
		}
		
        if(isset($this->params['conceptId']) && $this->params['conceptId']!="")
		{
			$this->view->conceptId = $this->params['conceptId'];
		} else {
			$this->view->conceptId = 0;
		}
		
		
    		//$this->aggregateVizDataAll();
    	
		//$this->d3Data = $this->aggregateVizDataAll();
		//$this->aggregateVizDataAll();
		
		//$this->view->d3JsonData = $this->d3Data;
		
		//print_r($this->d3Data);
    	

    }
 
    public function getd3jsonAction()
    {
    	// set default values for params
    	$this->params['vizEx']=0;
    	$this->params['vizQu']=0;
    	$this->params['vizMy']=0;
    	$this->params['vizCon']=0;
    	$this->params['conceptId']=0;
    	
    	$this->params = $this->getRequest()->getParams();
    			
		$this->_helper->layout()->disableLayout();

		// add all concepts
		//$this->view->d3JsonData = $this->aggregateConcepts();
		
		$this->view->d3JsonData = $this->aggregateVizDataAll();
		
		
		//$this->d3Data = "";
		
		//$this->view->d3JsonData = $this->d3Data;
		
		//print_r($this->d3Data);
		

		// add questions

		// add examples

		// add comments to examples [not implemented yet]

		// generate json
		//echo "<pre>";
		//print_r($this->conceptIds);
		//echo "</pre>";
	}
	
    /**
     * 
     * test/get concepts
     */
    private function aggregateConcepts()
    {
        global $PLACEWEB_CONFIG;
    	
    	$d3Data = new EloD3();
    	$d3Data->name = $PLACEWEB_CONFIG['homeNodeTitle'];
    	$d3Data->id= "home_0001";
    	$d3Data->type = "home";
		$d3Data->data=array(
			"elo" => "Home",
			"relation" => "test-home",
			"ref_id" => ""
		);
    	
        // get all concepts for a run_id
        $concepts = Doctrine::getTable("Concept")
                    ->findByDql("run_id = ?", $_SESSION['run_id']);
                            
        // add concepts as d3 objects
        foreach ($concepts as $concept)
        {
			// collect concept ids
			$this->conceptIds[] = $concept->id;
			
			// add concepts
			$myD3 = new EloD3();
			$myD3->id = "CON_".$concept->id;
			$myD3->name=$concept->name;
			$myD3->type="concept";
			$myD3->data=array(
				"elo" => "Concept",
				"relation" => "",
				"ref_id" => $concept->id
			);
	
			
			$d3Data->children[]=$myD3;
        } // end loop concepts
        
		return json_encode($d3Data);
//		print_r($this->conceptIds);
		
    } // end fnc

    // new
    private function aggregateVizDataAll()
    {
        global $PLACEWEB_CONFIG;
    	
    	// create a top viz object
        $d3Data = new EloD3();
    	$d3Data->name = $PLACEWEB_CONFIG['homeNodeTitle'];
    	$d3Data->id= "home_0001";
    	$d3Data->type = "home";
		$d3Data->data=array(
			'$type' => "star",
			'$color' => "#ccc",
			"elo" => "Home",
			"relation" => "test-home",
			"ref_id" => "",
			"author" => "Instructor"
		);
    	
		if($this->params['conceptId']!=0)
		{
	        // get selected concept 
	        $concepts = Doctrine::getTable("Concept")
	                 ->findByDql("run_id = ? AND id = ?", array($_SESSION['run_id'],$this->params['conceptId']));
			
		} else {
	        // get concepts for current run_id
	        $concepts = Doctrine::getTable("Concept")
	                 ->findByDql("run_id = ?", $_SESSION['run_id']);
			
		}

		// add concepts
		foreach ($concepts as $concept)
        {
			// collect concept ids [not used for now]
			$this->conceptIds[] = $concept->id;
			
			// add concepts as nodes
			$myD3 = new EloD3();
			$myD3->id = "CON_".$concept->id;
			$myD3->name=$concept->name;
			$myD3->type="concept";
			$myD3->data=array(
				'$type' => "circle",
				'$color' => "#DBB109",
				"elo" => "Concept",
				"relation" => "rel concept",
				"ref_id" => $concept->id,
				"author" => "Instructor"
			);
	
			///////////////////////////////////
			// find examples
			
        	if($this->params['vizMy']==1)
			{
				$q = Doctrine_Query::create()
				->select ("ec.id, e.id, e.name, u.display_name")
				->from("ExampleConcept ec")
				->innerJoin("ec.Example e")
				->innerJoin("e.User u")
				->where('ec.run_id = ? AND ec.concept_id = ? AND e.author_id = ?', 
				array($_SESSION['run_id'], $concept->id, $_SESSION['author_id']));
				
			} else {
				$q = Doctrine_Query::create()
				->select ("ec.id, e.id, e.name, u.display_name")
				->from("ExampleConcept ec")
				->innerJoin("ec.Example e")
				->innerJoin("e.User u")
				->where('ec.run_id = ? AND ec.concept_id = ?', array($_SESSION['run_id'],$concept->id));
			}

			$examples = $q->fetchArray();
			///*
			//echo "ExampleConcept<hr/>";
			//echo "<pre>"; 
			//print_r($examples);
			//echo "</pre>";
			//*/
			
			$hasEx = false;
   			// add examples attached to this concept
			if(isset($examples) && count($examples!=0) && $this->params['vizEx']==1) 
			{
				$hasEx = true;

				foreach($examples as $exConcept)
				{
					// get votes for an example_concept
					$ex_con_votes = array();
					$ex_con_votes = $this->countVotes($exConcept['id'], 4);
					
					// add tag-sum node
					$exTagSum = new EloD3();
					//$exTagSum->id = "EX_CON_TAG_".$exConcept['Example']['id']; // use the id of the example. this will not be unique ;)
					$exTagSum->id = "EX_CON_TAG_".$exConcept['id']; // this is unique
					$exTagSum->name = $ex_con_votes['votesMinus']. ' ['.$ex_con_votes['votesSumm'].'] '.$ex_con_votes['votesPlus'];
					$exTagSum->type="Tag";
					$exTagSum->data=array(
						'$type' => "none",
						'$color' => "#DBDAD3",
						'$dim' => "4",
						"elo" => "ex_con_tag",
						"relation" => "",
						"ref_id" => $exConcept['Example']['id'],
						"author" => ""

					);
				
					//echo "<hr>adding example... ".$exConcept['Example']['name'];
					$myD3ex = new EloD3();
					$myD3ex->id = "EX_".$exConcept['Example']['id']; // use the id of the example. this will not be unique ;)
					//$myD3ex->id = "EX_CON_".$exConcept['id']; // this is unique
					$myD3ex->name = ''.$exConcept['Example']['name'];
					$myD3ex->type="Example";
					$myD3ex->data=array(
						'$type' => "triangle",
						'$color' => "#80B376",
						"elo" => "Example",
						"relation" => "",
						"ref_id" => $exConcept['Example']['id'],
						"author" => $exConcept['Example']['User']['display_name']
					);
					
					// add example(s) as children to the current tag node
					$exTagSum->children[] = $myD3ex;
					
					// add Tag-sum node as children to the current concept
					$myD3->children[] = $exTagSum;
				
				} // end loop example_concept
			} // end if
			///////////////////////////////////
			
			// find questions
			$q1 = Doctrine_Query::create()
				->select ("qc.id, q.id, q.name")
				->from("QuestionConcept qc")
				->innerJoin("qc.Question q")
				->where('qc.run_id = ? AND qc.concept_id = ?', array($_SESSION['run_id'],$concept->id));					
			$questions = $q1->fetchArray();
			/*
			echo "QuestionConcept<hr/>";
			echo "<pre>"; 
			print_r($questions);
			echo "</pre>";
			*/
			
			$hasQu = false;
			// add questions attached to this concept
			if(isset($questions) && count($questions!=0) && $this->params['vizQu']==1)
			{
				$hasQu = true;

				foreach($questions as $quConcept)
				{
					// get votes for an question_concept
					$qu_con_votes = array();
					
					$qu_con_votes = $this->countVotes($quConcept['id'], 5);
					
					// add tag-sum node
					$quTagSum = new EloD3();
					//$quTagSum->id = "EX_CON_TAG_".$exConcept['Example']['id']; // use the id of the example. this will not be unique ;)
					$quTagSum->id = "QU_CON_TAG_".$quConcept['id']; // this is unique
					$quTagSum->name = $qu_con_votes['votesMinus']. ' ['.$qu_con_votes['votesSumm'].'] '.$qu_con_votes['votesPlus'];
					$quTagSum->type="Tag";
					$quTagSum->data=array(
						'$type' => "square",
						'$color' => "#DBDAD3",
						'$dim' => "4",
						"elo" => "qu_con_tag",
						"relation" => "",
						"ref_id" => $quConcept['Question']['id']
					);
					
					//echo "<hr>adding question... ".$quConcept['Question']['name'];
					$myD3qu = new EloD3();
					$myD3qu->id = "QE_".$quConcept['Question']['id']; // use the id of the question. this will not be unique ;)
					//$myD3qu->id = "QE_CON_".$quConcept['id']; // this is unique
					$myD3qu->name = ''.$quConcept['Question']['name'];
					$myD3qu->type="Question";
					$myD3qu->data=array(
						'$type' => "triangle",
						'$color' => "#D40015",
						"elo" => "Question",
						"relation" => "",
						"ref_id" => $quConcept['Question']['id']
					);
					
					// add question(s) as children to the current tag node
					$quTagSum->children[] = $myD3qu;
					
					// add Tag-sum node as children to the current concept
					$myD3->children[] = $quTagSum;

				} // end loop question_concept
				
			}
			///////////////////////////////////
			
			// Add concept as children to home node			
			$d3Data->children[]=$myD3;
				
			
        } // end loop concepts
        /*
		echo "<hr/>d3Data";
		echo "<pre>"; 
		print_r($d3Data);
		echo "</pre>";
		*/
        if($this->params['conceptId']!=0)
        {
        	// return concept as home node
        	return json_encode($myD3);
        } else {
        	// return home node with concept as children
        	return json_encode($d3Data);
        }
		
//		print_r($this->conceptIds);
		
    } // end fnc
    
    
	private function countVotes($obj_id, $obj_type)
	{
	    $q = Doctrine_Query::create()
		->select ("v.id, v.vote_value")
		->from("Vote v")
		->where('v.run_id = ? AND v.obj_id = ? AND v.obj_type = ?' , 
		array($_SESSION['run_id'],$obj_id, $obj_type)) 				
		->orderBy('v.id DESC');
		
		$votes = $q->fetchArray();
	
		$votesCount = array();
		$votesSumm = 0; $votesMinus = 0; $votesPlus = 0;
		
		foreach ($votes as $vote)
		{
			$votesSumm += $vote['vote_value'];
			
			if($vote['vote_value']==-1)
			{
				$votesMinus-= $vote['vote_value'];
			} else {
				$votesPlus+= $vote['vote_value'];
			}
			
		}
		$votesCount = array (
			"votesSumm" => $votesSumm,
			"votesMinus" => $votesMinus,
			"votesPlus" => $votesPlus
		);
		return $votesCount;
		// end get votes
		
	} // end countVotes()

}

