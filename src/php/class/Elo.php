<?php
/**
 * Elo Main Entity
 */
class Elo
{
	private $id;
	private $elo_name;
	private $elo_type_id;
	private $content_type;
	private $content_text;
	private $media_path;
	private $thumb_path;
	private $username;
	private $run_id;

	function __construct()
	{
		// we need some validation here and capture errors before assignation...
		// report errors/success 
		
	}// end constructor
	
	/**
	 * 
	 * Gets elo data, saves it and return the new elo's id
	 */
	//public function save($elo_name ,$elo_type_id ,$content_type ,$content_text ,$media_path ,$thumb_path ,$username ,$run_id)
	public function save()
	{
		global $db, $PLACEWEB_CONFIG;

		$this->id;
		$this->elo_name;
		$this->elo_type_id;
		$this->content_type;
		$this->content_text;
		$this->media_path;
		$this->thumb_path;
		$this->username;
		$this->run_id;
		
		// get all the posted data for each attribute 
		foreach($PLACEWEB_CONFIG['elos'] as $value)
		{
			echo '<br>'.$value.': '.$_REQUEST[$value];
			
		} // end foreach
		
	} // end save()
	
} // end class
?>
