<?php
/**
 * Post main entity
 */
class Post
{
	public $id;
	public $parentId; // we need to know if the parent is an ELO or another POST
	public $parentType; // this may solve the issue. it is also interestig that POST can be conceptualized as a self-contained module/entity that is eventually attached to other entities such as other POST, an ELO, or other 
	public $title;
	public $description; // this holds a HTML rich text: Rational
	public $author;
	public $runId;
	
	// some vars for temporal analysis. need to set this when inserting or updating a record...
	public $dateCreated;
	public $dateLastUpdate; // if applicable. it seems that for now ELOs cannot be updated/changed

	/**
	 * 
	 * Enter description here ...
	 * @param String $theId
	 * @param String $theParentId
	 * @param String $theParentType
	 * @param String $theTitle
	 * @param String $theDescription
	 * @param String $theAuthor
	 * @param String $theRunId
	 * @param String $theDateCreated
	 * @param String $theDateUpdated
	 */
	function __construct($theId, $theParentId, $theParentType, $theTitle, $theDescription, $theAuthor, $theRunId, $theDateCreated, $theDateUpdated) 
	{
		$this->id=$theId;
		$this->parentId = $theParentId;
		$this->parentType = $theParentType;
		$this->title = $theTitle;
		$this->description = $theDescription;
		$this->author = $theAuthor;
		$this->runId = $theRunId;
		$this->dateCreated = $theDateCreated;
		$this->dateLastUpdate = $theDateUpdated;
		
	}// end constructor
	
} // end class	
?>