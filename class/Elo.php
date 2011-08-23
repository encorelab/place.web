<?php
/**
 * Elo Main Entity
 */
class Elo
{
	public $id;
	public $name;
	public $type = array(); // this is more that a label, it defines what type of fields will be collected and it also constraints $choices...
	public $content = array();
	public $author;
	public $tags = array();
	public $discussion = array(); // it may be more eficient to have a post object and let be this a collection of nested post objects
	public $choices = array(); // I would imagine that $choices can be better managed as a polymorphic entity 
	public $runId;
	
	// some vars for temporal analysis
	public $dateCreated;
	public $dateLastUpdate; // if applicable. it seems that for now ELOs cannot be updated/changed
	
	// and yet a few more control vars such as 
	public $dateLastAccessed; 
	public $numberViews; // the number of views of visits, actually every time someone click on it

	/*
	 * we may want to add here some vars for visualization purposes
	 * such as:
	 * 		$shape
	 * 		$color
	 * 		... or better an array with all the parameter needed for D3
	 */

	/**
	 * 
	 * Elo Constructor
	 * @param String $theId
	 * @param String $theName
	 * @param array $theType
	 * @param array $theContent
	 * @param String $theAuthor
	 * @param array $theTags
	 * @param array $theDiscussion
	 * @param array $theChoices
	 * @param String $theRunId
	 */
	//function __construct(String $theId, String $theName, array $theType, array $theContent, String $theAuthor, array $theTags, array $thediscussion, array $theChoices, String $theRunId) 
	function __construct($theId, $theName, $theType, $theContent, $theAuthor, $theTags, $theDiscussion, $theChoices, $theRunId)
	{
		
		// we need some validation here and capture errors before assignation...
		
		$this->id=$theId;
		$this->name = $theName;
		$this->type=$theType;
		$this->content = $theContent;
		$this->author=$theAuthor;
		$this->tags=$theTags;
		$this->discussion = $theDiscussion;
		$this->choices = $theChoices;
		$this->runId = $theRunId;
		
		// report errors/success 
		
	}// end constructor
	
} // end class
?>
