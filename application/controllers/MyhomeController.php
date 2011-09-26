<?php

class MyhomeController extends Zend_Controller_Action
{

    public function init()
    {
		Placeweb_Authorizer::authorize();
    }

    public function indexAction()
    {
    	// calculate comment vote score
    	$this->view->commentScore = $this->calculateCommentScore();
    	
    	// calculate concept connection votes score
    	$this->view->tagScore = $this->calculateTagScore();
    	
    }
    
    public function calculateCommentScore(){
        // get all user's comments
        $comments = Doctrine::getTable("Comment")
                    ->findByDql("author_id = ? AND run_id = ?", array($_SESSION['author_id'], $_SESSION['run_id']));
                            
        $commentIds = array();
        foreach ($comments as $comment){
            $commentIds[] = $comment->id;
        }
        
        if (count($comments) == 0){
            return 0;
        }
        
        // sum up all the votes for the user comments found
        $votes = Doctrine_Query::create()
                    ->select("sum(vote_value) as vote_sum")
                    ->from("Vote")
                    ->whereIn("obj_id", $commentIds)
                    ->andWhere("obj_type = ?", Votable::$COMMENT)
                    ->execute();

        if (count($votes) == 0 || $votes[0]['vote_sum']==0){
            return 0;
        } else {
        	return $votes[0]['vote_sum'];
        }
        //return $votes[0]['vote_sum'];
    }
    

    
    public function calculateTagScore(){
        // get all user's QuestionConcept
        $questionConcepts = Doctrine::getTable("QuestionConcept")
                    ->findByDql("author_id = ? AND run_id = ?", array($_SESSION['author_id'], $_SESSION['run_id']));
        
        $questionConceptIds = array();
        
        foreach ($questionConcepts as $questionConcept){
            $questionConceptIds[] = $questionConcept->id;
        }
        
        if (count($questionConcepts) == 0){
            return 0;
        }
        
        // sum up all the votes for the user comments found
        $votes1 = Doctrine_Query::create()
                    ->select("sum(vote_value) as vote_sum")
                    ->from("Vote")
                    ->whereIn("obj_id", $questionConceptIds)
                    ->andWhere("obj_type = ?", Votable::$QUESTION_CONCEPT)
                    ->execute();

        if (count($votes1) == 0){
            $questionConceptScore = 0;
        } else {
        	$questionConceptScore = $votes1[0]['vote_sum'];
        }
        
    	// get all user's ExampleConcept
        $exampleConcepts = Doctrine::getTable("ExampleConcept")
                    ->findByDql("author_id = ? AND run_id = ?", array($_SESSION['author_id'], $_SESSION['run_id']));

        $exampleConceptIds = array();
        
        foreach ($exampleConcepts as $exampleConcept){
            $exampleConceptIds[] = $exampleConcept->id;
        }
        
        // sum up all the votes for the user comments found
        $votes2 = Doctrine_Query::create()
                    ->select("sum(vote_value) as vote_sum")
                    ->from("Vote")
                    ->whereIn("obj_id", $exampleConceptIds)
                    ->andWhere("obj_type = ?", Votable::$EXAMPLE_CONCEPT)
                    ->execute();

        if (count($votes2) == 0){
            $exampleConceptScore = 0;
        } else {
        	$exampleConceptScore = $votes2[0]['vote_sum'];
        }
        
        
        // test each score
       // echo "<hr>example_concept score: ". $exampleConceptScore;
       // echo "<hr>question_concept score: ". $questionConceptScore;
        
        $this->view->tagExampleScore=$exampleConceptScore;
        $this->view->tagQuestionScore=$questionConceptScore;
        $tagScoreTot = $questionConceptScore+$exampleConceptScore;
        
        //$this->view->tagScore = $tagScoreTot;
        return $tagScoreTot;
        
    }
        
    public function preferencesAction()
    {
        
    }
    
    public function classlistAction()
    {
		Placeweb_Authorizer::authorize("TEACHER");
        $this->view->students = Doctrine::getTable("User")->findByDql("user_type = 'STUDENT' AND run_id = ".$_SESSION["run_id"]);
    }

}

