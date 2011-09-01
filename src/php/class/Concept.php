<?php
class Concept
{
	public $id;
	public $name;
	public $curnitId;
	
	function __construct($theId, $theName, $theCurnitId)
	{
		$this->id=$theId;
		$this->name = $theName;
		$this->curnitId = $theCurnitId;
		
	} // end constructor
	
	
} // end class
?>
