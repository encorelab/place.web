<?php
/**
 * Post main entity
 */
class Post
{
	public $parentType; // this may solve the issue. it is also interestig that POST can be conceptualized as a self-contained module/entity that is eventually attached to other entities such as other POST, an ELO, or other 
	public $author;
	public $content; // this holds a HTML rich text: Rational
	public $timestamp;
	public $runId;
	public $grade;
	public $votes;
	public $replies;
	
	/*
		$fistPost = array(
		"parent_type" => "elo",
		"author" => $_SESSION['username'],
		"content"=> $_POST['myPost'],
		"timestamp" =>  new MongoTimestamp(),
		"runId" => $_SESSION['runId'],
		"grade" => "",
		"votes" => array(),
		"replies" => array()
	 */
	

	/**
	 * 
	 * Enter description here ...
	 * @param string $parentType
	 * @param string $author
	 * @param string $content
	 * @param MongoTimestamp $timestamp
	 * @param int $runId
	 * @param string $grade
	 * @param array $votes
	 * @param array $replies
	 */
	function __construct($parentType, $author, $content, $timestamp, $runId, $grade, $votes, $replies) 
	{
		$this->parentType = $parentType;
		$this->author = $author;
		$this->content = $content;
		$this->timestamp = $timestamp;
		$this->runId = $runId;
		$this->grade = $grade;
		$this->votes = $votes;
		$this->replies = $replies;
		
	}// end constructor
	
} // end class	
?>