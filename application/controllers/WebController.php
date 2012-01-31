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
	// set default values for viz
   	
    	$this->_helper->layout()->disableLayout();
    	
		$this->params = $this->getRequest()->getParams();
 
		$this->view->params = $this->params;
		
		if(!isset($this->params['vizType']))
		{
			$this->view->vizType = 2;
		}
		
		if(isset($this->params['vizType']))
		{
			$this->view->vizType = $this->params['vizType'];
		}

		if(isset($this->params['vizEx']))
		{
			$this->view->vizEx = $this->params['vizEx'];
		}

	    if(isset($this->params['vizQu']))
		{
			$this->view->vizQu = $this->params['vizQu'];
		}
		
	    if(isset($this->params['vizVo']))
		{
			$this->view->vizVo = $this->params['vizVo'];
		}
        if(isset($this->params['vizMy']))
		{
			$this->view->vizMy = $this->params['vizMy'];
		}
		
	    if(isset($this->params['vizCon']) && $this->params['vizCon']==1)
		{
			$this->view->vizCon = 1;
		} else {
			$this->view->vizCon = 0;
		}
		
	    if(isset($this->params['conceptId']))
		{
			$this->view->conceptId = $this->params['conceptId'];
		} else {
			$this->view->conceptId = array();
		}
	    if(isset($this->params['keyW']))
		{
			$this->view->keyW = $this->params['keyW'];
		} else {
			$this->view->keyW = "";
		}
    	if(isset($this->params['valueAA']))
		{
			$this->view->valueAA = $this->params['valueAA'];
		} else {
			$this->view->valueAA = "";
		}
    	if(isset($this->params['valueBB']))
		{
			$this->view->valueBB = $this->params['valueBB'];
		} else {
			$this->view->valueBB = "1335801600";
		}
		
        if(isset($this->params['vizDate']))
		{
			$this->view->vizDate = $this->params['vizDate'];
		} else {
			$this->view->vizDate = 0;
		}
		
    }
 
    public function testdataAction()
    {
    	$this->_helper->layout()->disableLayout();
     	//echo $this->aggregateVizDataNodeLink();
    }
    
    public function getd3jsonAction()
    {
    	// set default values for params
    	$this->params['vizEx']=0;
    	$this->params['vizQu']=0;
    	$this->params['vizMy']=0;
    	$this->params['vizCon']=0;
    	$this->params['vizVo']=0;
    	$this->params['keyK']='';
    	$this->params['concepId']=array();
    	$this->params['valueAA']="";
    	$this->params['valueBB']="";
    	$this->params['vizDate']=0;
    	
 	
    	$this->params = $this->getRequest()->getParams();

    	$this->view->vizType = $this->params['vizType'];
    	$this->view->keyK = $this->params['keyK'];
    	
		$this->_helper->layout()->disableLayout();
		
		// add all concepts [for testing purposes]
		//$this->view->d3JsonData = $this->aggregateConcepts();

		if($this->params['vizType']==1 || $this->params['vizType']==2)
		{
			// viz 2
			$this->view->d3JsonData = $this->aggregateVizDataAll();
		} else if($this->params['vizType']==3) {
			// viz 3
			$this->view->d3JsonData = $this->aggregateVizDataNodeLink();
		}
	}
	
    /**
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
				//"ref_id" => $concept->id
				"ref_id" => ""
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
    	$d3Data->name = $_SESSION['group_name'];
    	$d3Data->id= $_SESSION['group_name'];
    	$d3Data->type = "home";
		$d3Data->data=array(
			'$type' => "star",
			'$color' => "#475DFF",
			"elo" => "Home",
			"relation" => "",
			"ref_id" => "",
			"author" => "",
			"votes" => ""
		);

		// if "all concepts" is NOT selected
		if(isset($this->params['conceptId']) && !in_array('0', $this->params['conceptId'])) {
			$conceptIds = $this->params['conceptId'];
			$concepts = Doctrine_Query::create()
                    //->select("*")
                    ->from("Concept")
                    ->whereIn("id", $conceptIds)
                    ->andWhere("run_id = ?", $_SESSION['run_id'])
                    ->execute();
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
				//"ref_id" => $concept->id,
				"ref_id" => "",
				"author" => "",
				"votes" => ""
			);
	
			///////////////////////////////////
			// find examples
			
			$exWhereFields = 'ec.run_id = ? AND ec.concept_id = ?';
			$exWhereData = array($_SESSION['run_id'], $concept->id);
			
			$queryArray = $this->buildExSqlQuery($exWhereFields, $exWhereData);
			
			$this->view->dates = $queryArray; //print_r($queryArray);
			
			$q = Doctrine_Query::create()
			->select ("ec.id, e.id, e.name, e.content, e.media_content, e.media_type, e.date_created, u.display_name")
			->from("ExampleConcept ec")
			->innerJoin("ec.Example e")
			->innerJoin("e.User u")
			->where($queryArray[0], $queryArray[1]);
			
			$examples = $q->fetchArray();

   			// add examples attached to this concept
			if(isset($examples) && count($examples!=0) && $this->params['vizEx']==1) 
			{

				foreach($examples as $exConcept)
				{
					// get votes for an example_concept
					$ex_con_votes = array();
					$ex_con_votes = $this->countVotes($exConcept['id'], 4);
					
					// add tag-sum node
					$exTagSum = new EloD3();
					//$exTagSum->id = "EX_CON_TAG_".$exConcept['Example']['id']; // use the id of the example. this will not be unique ;)
					$exTagSum->id = "EX_CON_TAG_".$exConcept['id']; // this is unique
					$exTagSum->name = '['.$ex_con_votes['votesSumm'].']';
					$exTagSum->type="Tag";
					$exTagSum->data=array(
						'$type' => "none",
						'$color' => "#DBDAD3",
						'$dim' => "4",
						"elo" => "ex_con_tag",
						"relation" => "",
						//"ref_id" => $exConcept['Example']['id'],
						"ref_id" => "",
						"author" => "",
						"votes" => $ex_con_votes['votesMinus']. ' ['.$ex_con_votes['votesSumm'].'] '.$ex_con_votes['votesPlus']
					);
					
					// check if it is a video
					if (preg_match("/video/i", $exConcept['Example']['media_type']))
					{
						$isVideo = "1";
					} else {
						$isVideo = "0";
					}
					
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
						"content" => $exConcept['Example']['content'],
						"media_content" => $exConcept['Example']['media_content'],
						"is_video" => $isVideo,
						"author" => $exConcept['Example']['User']['display_name'],
						"votes" => "",
						"date" => strtotime ($exConcept['Example']['date_created']),
						"date1" => $exConcept['Example']['date_created']
					);
					
					// exclude example and example tag sum nodes if votes are equal to 0
					if ($ex_con_votes['votesSumm']!=0)
					{
						if ($this->params['vizVo']==1)
						{
							// add example(s) as children to the current tag node
							$exTagSum->children[] = $myD3ex;
						
							// add Tag-sum node as children to the current concept
							$myD3->children[] = $exTagSum;
	
						} else {
							// add example(s) as children to the current concept 
							$myD3->children[] = $myD3ex;
						}

					} // end if vote sum !=0
				} // end loop example_concept
			} // end if

			///////////////////////////////////
			// find questions
			
			$quWhereFields = 'qc.run_id = ? AND qc.concept_id = ? AND q.is_published = ?';
			$quWhereData = array($_SESSION['run_id'],$concept->id,1);
			
	        if($this->params['valueAA']!="" && $this->params['valueBB']!="" && $this->params['vizDate']==1)
			{
				$quWhereFields .= ' AND q.date_created BETWEEN ? AND ?';
				$quWhereData[] = date( 'Y-m-d H:i:s', $this->params['valueAA']);
				$quWhereData[] = date( 'Y-m-d H:i:s', $this->params['valueBB']);
			}
					
			$q1 = Doctrine_Query::create()
				->select ("qc.id, q.id, q.name, q.content, q.media_content, u.display_name")
				->from("QuestionConcept qc")
				->innerJoin("qc.Question q")
				->innerJoin("q.User u")
				->where($quWhereFields, $quWhereData);					
			$questions = $q1->fetchArray();
			
			// add questions attached to this concept
			if(isset($questions) && count($questions!=0) && $this->params['vizQu']==1)
			{
				foreach($questions as $quConcept)
				{
					// get votes for an question_concept
					$qu_con_votes = array();
					
					$qu_con_votes = $this->countVotes($quConcept['id'], 5);
					
					// add tag-sum node
					$quTagSum = new EloD3();
					//$quTagSum->id = "EX_CON_TAG_".$exConcept['Example']['id']; // use the id of the example. this will not be unique ;)
					$quTagSum->id = "QU_CON_TAG_".$quConcept['id']; // this is unique
					$quTagSum->name = '['.$qu_con_votes['votesSumm'].']';
					$quTagSum->type="Tag";
					$quTagSum->data=array(
						'$type' => "none",
						'$color' => "#DBDAD3",
						'$dim' => "4",
						"elo" => "qu_con_tag",
						"relation" => "",
						//"ref_id" => $quConcept['Question']['id'],
						"ref_id" => "",
						"author" => "Instructor",
						"votes" => $qu_con_votes['votesMinus']. ' ['.$qu_con_votes['votesSumm'].'] '.$qu_con_votes['votesPlus']

					);

					// check if it is a video
					if (preg_match("/video/i", $quConcept['Question']['media_type']))
					{
						$isVideo = "1";
					} else {
						$isVideo = "0";
					}
					
					
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
						"ref_id" => $quConcept['Question']['id'],
						"author" => $quConcept['Question']['User']['display_name'],
						"content" => $quConcept['Question']['content'],
						"media_content" => $quConcept['Question']['media_content'],
						"is_video" => $isVideo,
						"votes" => ""
					);
					
					// exclude question and question tag sum nodes if votes are equal to 0
					if ($qu_con_votes['votesSumm']!=0)
					{
						if ($this->params['vizVo']==1)
						{
							// add question(s) as children to the current tag node
							$quTagSum->children[] = $myD3qu;
							
							// add Tag-sum node as children to the current concept
							$myD3->children[] = $quTagSum;
						} else {
							// add question(s) as children to the current concept
							$myD3->children[] = $myD3qu;
						}
					} // end if vote sum !=0

				} // end loop question_concept
				
			}
			///////////////////////////////////

			// Add concept as children to home node			
			$d3Data->children[]=$myD3;
			
        } // end loop concepts
        
        if(isset($this->params['conceptId']) && count($this->params['conceptId']) == 1 && $this->params['conceptId'][0]!=0)
        {
        	// return concept as home node
        	return json_encode($myD3);
        } else {
        	// return home node with concept as children
        	return json_encode($d3Data);
        }
		
    } // end fnc
    
	/** 
	 * 
	 * function to be used in a force directed JIT graph
	 */
    private function aggregateVizDataNodeLink()
    {
        global $PLACEWEB_CONFIG;
        
        $nodeLinkCollection = array();
        $conceptIdsA = array();
        $tagIdsA = array();
        $examplesIdsA = array();
        $questionsIdsA = array();
    	
		// create home node
		$myHomeNode = new EloNode();
		
		// set vals for that node : id and name
		$myHomeNode->id = $_SESSION['group_name'];
		$myHomeNode->name = $_SESSION['group_name'];
		
		// custom data attributes
		$myHomeNode->setDataAttribute("elo", "Home");
		
		// redefine JIT essential attr
		$myHomeNode->setDataAttribute('$type', 'star');
		$myHomeNode->setDataAttribute('$color', '#475DFF');
		
		////////////////////////////////////////////////////////

		// if "all concepts" is NOT selected
		if(isset($this->params['conceptId']) && !in_array('0', $this->params['conceptId'])) {
			$conceptIds = $this->params['conceptId'];
			$concepts = Doctrine_Query::create()
                    //->select("*")
                    ->from("Concept")
                    ->whereIn("id", $conceptIds)
                    ->andWhere("run_id = ?", $_SESSION['run_id'])
                    ->execute();
		} else {
	        // get concepts for current run_id
	        $concepts = Doctrine::getTable("Concept")
	                 ->findByDql("run_id = ?", $_SESSION['run_id']);
		}

		// add concepts
		foreach ($concepts as $concept)
        {
        	$conceptIdsA[] = "CON_".$concept->id;

        	// create concept node
			$myConNode = new EloNode();
			
			// set vals for that node : id and name
			$myConNode->id = "CON_".$concept->id;
			$myConNode->name = $concept->name;
			
			// custom data attributes
			$myConNode->setDataAttribute("elo", "Concept");
        	
			// create Adjacency Object
			$conAdjency = new EloNodeAdjacency($myConNode->id, $myHomeNode->id);
			
			// add concept as adjacency to home node
			$myHomeNode->addAdjacency($conAdjency);

	
			///////////////////////////////////
			// find examples
			
			$exWhereFields = 'ec.run_id = ? AND ec.concept_id = ?';
			$exWhereData = array($_SESSION['run_id'], $concept->id);
			
			$queryArray = $this->buildExSqlQuery($exWhereFields, $exWhereData);
			
			$this->view->data = $queryArray;
			
				$q = Doctrine_Query::create()
				->select ("ec.id, e.id, e.name, e.content, e.media_content, e.media_type, u.display_name")
				->from("ExampleConcept ec")
				->innerJoin("ec.Example e")
				->innerJoin("e.User u")
				->where($queryArray[0], $queryArray[1]);

			$examples = $q->fetchArray();

   			// add examples attached to this concept
			if(isset($examples) && count($examples!=0) && $this->params['vizEx']==1) 
			{
				foreach($examples as $exConcept)
				{
					// get votes for an example_concept
					$ex_con_votes = array();
					$ex_con_votes = $this->countVotes($exConcept['id'], 4);
					
					/*
					 * Tag Node
					 */
					$tagIdsA[] = "EX_CON_TAG_".$exConcept['id'];
					
					// create tag node
					$exTagSum = new EloNode();

					// set vals for that node : id and name
					$exTagSum->id = "EX_CON_TAG_".$exConcept['id']; // this is unique
					$exTagSum->name = '['.$ex_con_votes['votesSumm'].']';
					
					// custom data attributes
					$exTagSum->setDataAttribute('$type', 'none');
					$exTagSum->setDataAttribute("elo", "Tag");
					//$exTagSum->setDataAttribute('$color', '#80B376');
					$exTagSum->setDataAttribute("votes", $ex_con_votes['votesMinus']. ' ['.$ex_con_votes['votesSumm'].'] '.$ex_con_votes['votesPlus']);
					
										 
					// create Adjacency Object
					$exTagSumAdjency = new EloNodeAdjacency($exTagSum->id, $myConNode->id);
					
					if ($this->params['vizVo']==1 && $ex_con_votes['votesSumm']!=0)
					{
						// add tag as adjacencies of concept node
						$myConNode->addAdjacency($exTagSumAdjency); 
					}
					
					/*
					 * example node
					 */
					$examplesIdsA= "EX_".$exConcept['Example']['id'];
					
					// create tag node
					$exNode = new EloNode();

					// set vals for that node : id and name
					$exNode->id = "EX_".$exConcept['Example']['id'];
					$exNode->name = $exConcept['Example']['name'];
					$exNode->setDataAttribute('$type', 'triangle');
					$exNode->setDataAttribute('$color', '#80B376');
					$exNode->setDataAttribute('elo', 'Example');
					$exNode->setDataAttribute('ref_id', $exConcept['Example']['id']);
					$exNode->setDataAttribute('author', $exConcept['Example']['User']['display_name']);
					$exNode->setDataAttribute('content', $exConcept['Example']['content']);
					$exNode->setDataAttribute('media_content', $exConcept['Example']['media_content']);

					// check if it is a video
					if (preg_match("/video/i", $exConcept['Example']['media_type']))
					{
						$isVideo="1";
					} else {
						$isVideo="0";
					}
					$exNode->setDataAttribute('is_video', $isVideo); 
					
					// exclude example and example tag sum nodes if votes are equal to 0
					if ($ex_con_votes['votesSumm']!=0) {
					
						// create Adjacency Object
						if ($this->params['vizVo']==1)
						{
							$exAdjency = new EloNodeAdjacency($exNode->id, $exTagSum->id);
							
							// add example as adjacencies of tag node
							$exTagSum->addAdjacency($exAdjency);
							
							// add tag node to collection 
							$nodeLinkCollection[]=$exTagSum;
							
						} else {
							$exAdjency = new EloNodeAdjacency($exNode->id, $myConNode->id);
							// add example as adjacencies of concept node
							$myConNode->addAdjacency($exAdjency);
							
						}
					} // end if vote !=0
					
					// add example node to collection
					$nodeLinkCollection[]=$exNode;

				} // end loop example_concept
				
			} // end if examples


			///////////////////////////////////
			// find questions
			$quWhereFields = 'qc.run_id = ? AND qc.concept_id = ? AND q.is_published = ?';
			$quWhereData = array($_SESSION['run_id'],$concept->id,1);
			
	        if($this->params['valueAA']!="" && $this->params['valueBB']!="" && $this->params['vizDate']==1)
			{
				$quWhereFields .= ' AND q.date_created BETWEEN ? AND ?';
				$quWhereData[] = date( 'Y-m-d H:i:s', $this->params['valueAA']);
				$quWhereData[] = date( 'Y-m-d H:i:s', $this->params['valueBB']);
			}
					
			$q1 = Doctrine_Query::create()
				->select ("qc.id, q.id, q.name, q.content, q.media_content, u.display_name")
				->from("QuestionConcept qc")
				->innerJoin("qc.Question q")
				->innerJoin("q.User u")
				->where($quWhereFields, $quWhereData);					
			$questions = $q1->fetchArray();
			
			// add questions attached to this concept
			if(isset($questions) && count($questions!=0) && $this->params['vizQu']==1)
			{
				foreach($questions as $quConcept)
				{
					// get votes for a question_concept
					$qu_con_votes = array();
					
					$qu_con_votes = $this->countVotes($quConcept['id'], 5);
					
					/*
					 * Tag Node
					 */
					// create tag node
					$quTagSum = new EloNode();

					// set vals for that node : id and name
					$quTagSum->id = "QU_CON_TAG_".$quConcept['id']; // this is unique
					$quTagSum->name = '['.$qu_con_votes['votesSumm'].']';
					
					// custom data attributes
					$quTagSum->setDataAttribute('$type', 'none');
					$quTagSum->setDataAttribute("elo", "Tag");
					//$quTagSum->setDataAttribute('$color', '#80B376');
					$quTagSum->setDataAttribute("votes", $qu_con_votes['votesMinus']. ' ['.$qu_con_votes['votesSumm'].'] '.$qu_con_votes['votesPlus']);
					
										 
					// create Adjacency Object
					$quTagSumAdjency = new EloNodeAdjacency($quTagSum->id, $myConNode->id);
					
					if ($this->params['vizVo']==1 && $qu_con_votes['votesSumm']!=0)
					{
						// add tag as adjacencies of concept node
						$myConNode->addAdjacency($quTagSumAdjency); 
					}
					
					/*
					 * question node
					 */
					// create tag node
					$quNode = new EloNode();

					// set vals for that node : id and name
					$quNode->id = "QU_".$quConcept['Question']['id'];
					$quNode->name = $quConcept['Question']['name'];
					$quNode->setDataAttribute('$type', 'triangle');
					$quNode->setDataAttribute('$color', '#D40015');
					$quNode->setDataAttribute('elo', 'Question');
					$quNode->setDataAttribute('ref_id', $quConcept['Question']['id']);
					$quNode->setDataAttribute('author', $quConcept['Question']['User']['display_name']);
					$quNode->setDataAttribute('content', $quConcept['Question']['content']);
					$quNode->setDataAttribute('media_content', $quConcept['Question']['media_content']);

					// check if it is a video
					if (preg_match("/video/i", $quConcept['Question']['media_type']))
					{
						$isVideo="1";
					} else {
						$isVideo="0";
					}
					
					$quNode->setDataAttribute('is_video', $isVideo);

					// exclude question and question tag sum nodes if votes are equal to 0
					if ($qu_con_votes['votesSumm']!=0) {
					
					
						// create Adjacency Object
						if ($this->params['vizVo']==1)
						{
							$quAdjency = new EloNodeAdjacency($quNode->id, $quTagSum->id);
							
							// add question as adjacencies of tag node
							$quTagSum->addAdjacency($quAdjency);
							
							// add tag node to collection 
							$nodeLinkCollection[]=$quTagSum;
							
						} else {
							$quAdjency = new EloNodeAdjacency($quNode->id, $myConNode->id);
							// add question as adjacencies of concept node
							$myConNode->addAdjacency($quAdjency);
						}
						
					} // end if vote !=0
					
					// add question node to collection
					$nodeLinkCollection[]=$quNode;


				} // end loop question_concept
				
			}
			///////////////////////////////////
			
	        // add concept to collection
	        $nodeLinkCollection[]=$myConNode;
	        
        } // end loop concepts

        // add home node to collection 
        $nodeLinkCollection[]=$myHomeNode;
        
        return json_encode($nodeLinkCollection);
		
    } // end fnc
    

    private function getFitstAndLastDate()
    {
    
    }
    
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
	
	private function buildExSqlQuery($fields, $data)
	{
		$exWhereFields = $fields;
		$exWhereData = array();
		$exWhereData = $data;
		
		// show only published examples
		$exWhereFields .= ' AND e.is_published = ?';
		$exWhereData[] = 1;
		
//		$exWhereFields = 'ec.run_id = ? AND ec.concept_id = ?';
//		$exWhereData = array($_SESSION['run_id'], $conceptId);
		 
		if($this->params['vizMy']==1)
		{
			$exWhereFields .= ' AND e.author_id = ?';
			$exWhereData[] = $_SESSION['author_id'];
		}
		
		if($this->params['valueAA']!="" && $this->params['valueBB']!="" &&  $this->params['vizDate']==1)
		{
			$exWhereFields .= ' AND e.date_created BETWEEN ? AND ?';
			$exWhereData[] = date( 'Y-m-d H:i:s', $this->params['valueAA']);
			$exWhereData[] = date( 'Y-m-d H:i:s', $this->params['valueBB']);
		}
		

		if($this->params['keyW']!="")
		{
			$this->params['keyW'] = trim($this->params['keyW']);
			if(str_word_count($this->params['keyW'])>1)
			{
				$kewords = explode(" ", $this->params['keyW']);
				foreach ($kewords as $k)
				{
					$exWhereFields .= ' AND e.content LIKE ?';
					$exWhereData[] = '%'.$k.'%';
				}
				
			} else {
					$exWhereFields .= ' AND e.content LIKE ?';
					$exWhereData[] = '%'.$this->params['keyW'].'%';
			}
			
		}
		
		$queryFieldsData[0] = $exWhereFields;
		$queryFieldsData[1] = $exWhereData;
		
		return $queryFieldsData;
			
	} // end buildExSqlQuery()

}
