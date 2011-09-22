<?php

class TagsController extends Zend_Controller_Action
{

    public function init()
    {
        /* check session var */
    	if(!$_SESSION['access'])
    	{
    		header('Location: /');
    	}
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

		/*
		 * $params['tag_type']
		 * // 1 for example_concept, 2 for question_concept
		 */
		
		// adding example_concept
		if($params['tag_type']=="1") 
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
				
				
				// add activity log
				$prefix=$params['prefix'];
				$activity_type_id = $params[$prefix.'activity_type_id']; 
				$i1 = $params['qe_id'];
				$i2 = $params['concept_id'];
				$i3 = $example_concept->id;
				$s1 = $params[$prefix.'s1'];
				$s2 = $params[$prefix.'s1'];
				$s3 = $params[$prefix.'s1'];
				$t1 = $params[$prefix.'t1'];
				$t2 = "";
				
				$this->addActivity($activity_type_id, $i1, $i2, $i3, $s1, $s2, $s3, $t1, $t2);
				
				header('Location: /example/show/?id='.$params['qe_id']);
			}
			
			// adding question_concept
		} else if($params['tag_type']=="2") {

			// add only if it does not exist: so check it in the db
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
				
				// add activity log
				$prefix=$params['prefix'];

				$activity_type_id = $params[$prefix.'activity_type_id'];

				$i1 = $params['qe_id'];
				$i2 = $params['concept_id'];
				$i3 = $question_concept->id;
				$s1 = $params[$prefix.'s1'];
				$s2 = $params[$prefix.'s1'];
				$s3 = $params[$prefix.'s1'];
				$t1 = $params[$prefix.'t1'];
				$t2 = "";
				
				$this->addActivity($activity_type_id, $i1, $i2, $i3, $s1, $s2, $s3, $t1, $t2);
				
				header('Location: /question/show?id='.$params['qe_id']);
			}
			
			
		} // end if adding question_concept
//*/
		

    } // end addAction()
	
    // dump function in activity : this must be reused ;)
    private function addActivity($activity_type_id, $i1, $i2, $i3, $s1, $s2, $s3, $t1, $t2)
	{
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		$activity->date_created = date( 'Y-m-d H:i:s');
		
		$activity->activity_type_id = $activity_type_id; 

		$activity->i1 = $i1;
		$activity->i2 = $i2;
		$activity->i3 = $i3;
		$activity->i4 = "";
		$activity->i5 = "";
		
		$activity->s1 = $s1;
		$activity->s2 = $s2;
		$activity->s3 = $s3;
		
		$activity->t1 = $t1;
		//$activity->t2 = $t2;
		
		$activity->save();
		
		//echo "<br>activity Id: ".$activity->id;
		
	} 
}

