<?php
class PlaceWebTools
{
	public static function getCurrentDate()
	{
		$d = date("m.d.Y H:i:s");
		return $d;
		
	} // end _getCurrentDate()
	
	/**
	 * 
	 * Generates a <select> object from an array
	 * @param array $dataAr
	 * @param String $selectedVal
	 * @param String $name
	 */
	public static function arrayToHtmlSelect($dataAr, $selectedVal, $name)
	{
		$html = '
		<select id="'.$name.'" name="'.$name.'">';

		foreach($dataAr as $val => $name)
		{
			if($val==$selectedVal)
			{
				$selected=" selected";
			} else {
				$selected="";
			}
	
			$html .= '
				<option '.$selected.' value="'.$val.'">'.$name.'</option>';
		}
	
		$html.='</select></span>';
		
		return $html;
		
	} // end arrayToHtmlSelect()
	
	/**
	 * 
	 * Generates a list of checkboxes
	 * @param array $dataAr
	 * @param String $namePrefix
	 */
	public static function arrayToHtmlCheckBoxList($dataAr, $namePrefix)
	{
		$html = '
		<ul class="ul-for-data">';

		foreach($dataAr as $val => $name)
		{
	
			$html .= '
				<li><input type="checkbox" name="'.$namePrefix.'_'.$val.'" value="'.$name.'"/>'.$name.'</li>';
		}
	
		$html.='
		</ul>';
		
		return $html;
		
	} // end arrayToHtmlSelect()
	
} // end class
