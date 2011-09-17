<?php

class TagsController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        
    	//echo "<hr>";
    }

	public function addAction()
    {
		//global $PLACEWEB_CONFIG;
		$this->_helper->layout->disableLayout();
    	
		$params = $this->getRequest()->getParams();
		
		//print_r($params);
///*
		
		// adding example_concept
		if($params['tag_type']=="1") // 
		{
			// add only if it does not exist::
			$q = Doctrine_Query::create()
			->select('e.id')
			->from('ExampleConcept e')
			->where('e.run_id = ? AND e.example_id = ? AND e.concept_id = ?', 
			array($_SESSION['run_id'], $params['qe_id'], $params['concept_id']));
			 
			$result = $q->fetchArray();
			//print_r($result);
			
			if(count($result)!=0)
			{
				echo "
				<script>
				alert('This tag is already associated to the Example.');
				</script>";
				header('Location: '.$_SERVER['HTTP_REFERER']); 
			} else {
		
				$example_concept = new ExampleConcept();
				$example_concept->run_id = $_SESSION['run_id'];
				$example_concept->author_id = $_SESSION['author_id'];
				//$example_concept->date_modified = date( 'Y-m-d H:i:s');
				$example_concept->date_created = date( 'Y-m-d H:i:s');
				$example_concept->example_id= $params['qe_id'];
				$example_concept->concept_id= $params['concept_id'];
				$example_concept->save();
				
				//echo "<br>Example_concept Id: ".$example_concept->id;
				
				header('Location: /example/show/?id='.$params['qe_id']);
			}
			
			// adding question_concept
		} else if($params['tag_type']=="2") {

			// add only if it does not exist::
			$q = Doctrine_Query::create()
			->select('e.id')
			->from('QuestionConcept e')
			->where('e.run_id = ? AND e.question_id = ? AND e.concept_id = ?', 
			array($_SESSION['run_id'], $params['qe_id'], $params['concept_id']));
			 
			$result = $q->fetchArray();
			//print_r($result);
			
			if(count($result)!=0)
			{
				echo "
				<script>
				alert('This tag is already associated to the Example.');
				</script>";
				header('Location: '.$_SERVER['HTTP_REFERER']); 
			} else {
				$question_concept = new QuestionConcept();
				$question_concept->run_id = $_SESSION['run_id'];
				$question_concept->author_id = $_SESSION['author_id'];
				//$question_concept->date_modified = date( 'Y-m-d H:i:s');
				$question_concept->date_created = date( 'Y-m-d H:i:s');
				$question_concept->question_id= $params['qe_id'];
				$question_concept->concept_id= $params['concept_id'];
				$question_concept->save();
				
				//echo "<br>question_concept Id: ".$question_concept->id;
				
				header('Location: /question/show?id='.$params['qe_id']);
			}
			
			
		}
//*/
		

    } // end add
}

