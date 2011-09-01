<?php
class ImageManager
{
	
	public static function generateThumb($imagePath,$imgName)
	{
		// split name 
		$imgTemp = explode('.', $imgName);
		/* Read the image */
		$im = new Imagick($imagePath.$imgName);

		$thumb = $im->clone();
		
		$thumb->thumbnailImage(320, 0);
		
		//$width = $im->getImageWidth() + 40;
		
		//$height = ($im->getImageHeight() * 2) + 30;
		
		$thumb->writeImages("thb_".$imgName, true);
		
		echo '<hr/>Thumbnail saved!';
				
	}
} // end class