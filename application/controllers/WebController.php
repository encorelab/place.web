<?php

class WebController extends Zend_Controller_Action
{
    public function init()
    {
		Placeweb_Authorizer::authorize();
	}

    public function indexAction()
    {

	    $this->aggregateDataforD3();
    }
 
    public function addAction()
	{
    }
    
    public function getd3jsonAction()
	{
		$this->_helper->layout()->disableLayout();
		$this->view->d3JsonData = $this->aggregateDataforD3();
	}
	
    /**
     * 
     * test concepts
     */
	private function aggregateDataforD31()
    {
    	
    	$d3Data = new EloD3();
    	$d3Data->name = "Physics Learning Across <br/>Contexts and Environments";
    	$d3Data->id= "home_0001";
    	$d3Data->type = "home";
		$d3Data->data=array(
			"elo" => "Home",
			"relation" => "test-home"
		);
    	
        // get all concepts for a run_id
        $concepts = Doctrine::getTable("Concept")
                    ->findByDql("run_id = ?", $_SESSION['run_id']);
                            
        // add concepts as d3 objects
        $conceptIds = array();
        foreach ($concepts as $concept)
        {
			$myD3 = new EloD3();
			$myD3->id = "CON_".$concept->id;
			$myD3->name=$concept->name;
			$myD3->type="concept";
			$myD3->data=array(
				"elo" => "some text for this elo",
				"relation" => "some text for this relation"
			);
			// find all examples attached to this concept
			
			// test adding a child to a child
			if($concept->id==37)
			{
				$myD31 = new EloD3();
				$myD31->id = "anto_30"; // this id should exists somewhere
				$myD31->name="anto test";
				$myD31->type="concept";
				$myD31->data=array(
					"elo" => "some text for this elo",
					"relation" => "CON_37"
				);
				$myD3->children[]=$myD31;
			}
			
			$d3Data->children[]=$myD3;
        } // end loop concepts
        
		return json_encode($d3Data);
		
    } // end fnc

    private function aggregateDataforD3()
    {
    	global $PLACEWEB_CONFIG;
    	
    	$d3Data = new EloD3();
    	$d3Data->name = $PLACEWEB_CONFIG['homeNodeTitle'];
    	$d3Data->id= "home_0001";
    	$d3Data->type = "Home";
		$d3Data->data=array(
			"elo" => "Home",
			"relation" => ""
		);

		$q = Doctrine_Query::create()
			->select ("c.id, c.name, ec.id, e.id, e.name")
			->from("Concept c")
			->innerJoin("c.ExampleConcept ec")
			->innerJoin("ec.Example e")
			->where('c.run_id = ?' , $_SESSION['run_id']);					
			//->orderBy('a.id DESC');
		$concepts = $q->fetchArray();


        // add concepts as d3 objects
        $conceptIds = array();
        foreach ($concepts as $concept)
        {
			$myD3 = new EloD3();
			$myD3->id = "CON_".$concept['id'];
			$myD3->name=$concept['name'];
			$myD3->type="Concept";
			$myD3->data=array(
				"elo" => "Concept",
				"relation" => ""
			);
			
			// find all examples attached to this concept
			if(isset($concept['ExampleConcept']) && count($concept['ExampleConcept']!=0))
			{
				foreach($concept['ExampleConcept'] as $exConcept)
				{
					$myD3a = new EloD3();
					$myD3a->id = "EX_".$exConcept['Example']['id']; // use the id of the example. this will not be unique ;)
					//$myD3a->id = "EX_CON".$exConcept['id']; // this is unique
					$myD3a->name=$exConcept['Example']['name'];
					$myD3a->type="Example";
					$myD3a->data=array(
						"elo" => "Example",
						"relation" => ""
					);
					
					// add example(s) to the concept
					$myD3->children[] = $myD3a;
			
				} // end loop example_concept
			}
			
			$d3Data->children[]=$myD3;
			
        } // end loop concepts
        
		return json_encode($d3Data);
		
    } // end fnc

}

