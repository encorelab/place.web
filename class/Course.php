<?php
/**
 * Elo Main Entity
 */
class Course
{
	public $id;
	public $name;
	public $userId;
	public $tags = array(); // holds the available tags for this course
	public $equations = array(); 
	public $runId;
	public $curnitId;
	
	
	
	/**
	 * 
	 * Enter description here ...
	 * @param string $theId
	 * @param string $theName
	 * @param string $theUserId
	 * @param string $theTags
	 * @param string $theEquations
	 * @param string $theRunId
	 * @param string $theCurnitId
	 */
	function __construct($theId, $theName, $theUserId, $theTags, $theEquations, $theRunId, $theCurnitId)
	{
		
		// we need some validation here and capture errors before assignation...
		
		$this->id=$theId;
		$this->name = $theName;
		$this->userId=$theUserId;
		$this->tags= $theTags;
		$this->author=$theAuthor;
		$this->tags=$theTags;
		$this->posts = $thePosts;
		$this->choices = $theChoices;
		$this->runId = $theRunId;
		$this->curnitId = $theCurnitId;
		
	}// end constructor
	
} // end class
?>
