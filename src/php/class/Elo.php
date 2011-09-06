<?php
/**
 * Elo Main Entity
 */
class Elo
{
	private $id;
	private $name;
	private $run_id;
	private $author_id;
	private $date_created;
	private $date_modified;
	private $media_type;
	private $media_uri;
	private $thumb_uri;
        
	function __construct()
	{
		// we need some validation here and capture errors ...
		// report errors/success 
		
	}// end constructor
	
	/**
	 * 
	 * Gets an elo object and saves.
	 * This function neends to be overwitten by each sub class 
	 */
	public function save($eloObject)
	{

		
	} // end save()
	
} // end class
?>
