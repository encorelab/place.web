<?php

/**
 * 
 * There is a bit of confusion with this entity
 * it is not clear where shoud it "live".
 * nor is it clear what will be the most "efficient" way of retrieving it
 * @author anto
 *
 */
class Tag 
{
	public $id;
	public $name; 
	public $parentId; // $eloId
	public $author;
	public $date;	
	public $runId;
	
	
	function __construct($theId, $theName, $theParentId)
	{
		if($id!="")
		{
			$this->id = $id;
		}
		
		$this->name = $theName;
		$this->parentId = $theParentId;
	} // end fnc
	
} // end class
?>
