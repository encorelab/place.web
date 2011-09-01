<?php
/**
 * Activity LOG
 */
class Activity
{
	public $mongoId;
	public $collectionName;
	public $type;
	public $msg;
	public $author;
	public $timestamp;

	/**
	 * 
	 * Logs activity in the system 
	 * @param string  $mongoId
	 * @param string $collectionName
	 * @param int $type
	 * @param string $msg
	 * @param string $author
	 * @param MongoTimestamp $timestamp
	 */
	function __construct($mongoId, $collectionName, $type, $msg, $author, $timestamp)
	{
		$this->mongoId = $mongoId;
		$this->collectionName = $collectionName;
		$this->type = $type;
		$this->msg = $msg;
		$this->author = $author;
		$this->timestamp = new MongoTimestamp();
	
	}// end constructor
	
} // end class
?>
