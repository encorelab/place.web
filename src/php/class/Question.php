<?php
class Question extends Elo
{
	private $type; // text or multiple question
	private $mcNumber; // number of choices for a multiple choice question
	
	/*
	 * In case we want to store the choices for this questions in the db. 
	 * for now it is assumed that answer choices are included in an image. which has some issues
	 */
	private $choices = array(); 
        
	function __construct()
	{
		
	}// end constructor
	
	public function setAnswerChoices($choices)
	{
		/*
		 * $choices is an array in the following structure:
 
			$choices = array(
				"A" => "The text of the answer ",
				"B" => "The text of the answer "
				);
		 */
	} // end setAnswerChoices()
	
	public function save($eloObject)
	{

		global $db, $PLACEWEB_CONFIG;

		$this->id;
		$this->name;
		$this->elo_type_id;
		$this->content_type;
		$this->content_text;
		$this->media_path;
		$this->thumb_path;
		$this->username;
		$this->run_id;
		
		
		// get all the posted data for each attribute 
		foreach($PLACEWEB_CONFIG['question'] as $value)
		{
			echo '<br>'.$value.': '.$_REQUEST[$value];
			
		} // end foreach
		
	} // end save()
	
} // end class
?>
