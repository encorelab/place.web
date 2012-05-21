<?php
if(isset($_REQUEST['t']))
{
	$dataType=$_REQUEST['t'];
} else {
	$dataType="";
}

include('../../application/configs/config.php');

//doctrine.dsn = "mysql://root:anto123@localhost/placeweb"
//doctrine.dsn = "mysql://placeweb:placeweb@localhost/placeweb"

define('DB_USER', 'root');
define('DB_PASSWORD', 'anto123');
define('DB_HOST', 'localhost');
define('DB_PORT', '3306');
define('DB_NAME', 'placeweb');

/* connect to mysql database */	
$db = mysql_connect(DB_HOST . ':' . DB_PORT, DB_USER, DB_PASSWORD);
if (!$db) {
	trigger_error('VITAL#Unable to connect to db.', E_USER_ERROR);
	exit;
}
if (!mysql_select_db(DB_NAME, $db)) {
	trigger_error('VITAL#DB connection established, but database "'.DB_NAME.'" cannot be selected.', E_USER_ERROR);
	exit;
}

/* loading assets form NEOplace */
$problems = file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/problems.json');
$problems_array = json_decode($problems, true);
$equations = file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/equations.json');
$equations_array = json_decode($equations, true);

if($dataType=="homework_individual")
{
	homework_individual();
} else if($dataType=="homework_aggregated"){
	homework_aggregated();
} else {
	echo "parameters missing";
}

/*accessing SQL directly: no ZEND*/

    function homework_individual()
    {
    	global $db, $PLACEWEB_CONFIG, $problems_array, $equations_array;
    	
		$sql   = "SELECT * FROM smartroom_hw";
			//$result  = mysql_query($query, $db) or die('Error count query:'.mysql_error());
			//$homework = mysql_fetch_array($result, MYSQL_ASSOC);
		
		$homework = mysql_query($sql, $db) or die('An error happened searching the Directory');

		$hwIndividualCollection = array();
		
		//while ($hw = mysql_fetch_array($result, MYSQL_ASSOC))
		while(($hw=mysql_fetch_assoc($homework)) != null) 
		{
			//print_r($hw);
			
			$probPrinciplesNames = explode(",", $hw['principles']);
			$probEquationsIs = explode(",", $hw['equations']);

			$probPrinciplesInTargetFormat = array();
			$probEquationsInTargetFormat = array();

			foreach($probPrinciplesNames as $pn)
			{
				//$pn = mysql_real_escape_string($pn);
				
				$pn = stripcslashes($pn);

				// formatting to expected format
				$probPrinciplesNames = array(
					'name'=>$pn
				);
				
				// add ony if not empty
				if($pn){
					$probPrinciplesInTargetFormat[]=$probPrinciplesNames;
				}
			} // end loop principles
			
			// build equations array
			for ($i=0;$i<count($probEquationsIs);$i++) 
			{
				// index = EQ_ID - 1
				$index = $probEquationsIs[$i]-1;
				// get equation expression
				$probEquationsNames= array(
					'name'=>$equations_array[$i]['name']
				);
				//echo "<br/>".$probEquationsIs[$i].'. ---'.addslashes($equations_array[$index]['name']);
				$probEquationsInTargetFormat[]=$probEquationsNames;
			}
			
			$hwIndividual = array(
				'studentId'=>$hw['username'],
				'problemName'=>$hw['problem_name'],
				'principles'=>$probPrinciplesInTargetFormat,
				'equations'=>$probEquationsInTargetFormat,
			);
			
			$hwIndividualCollection[]=$hwIndividual;
		}
		
		echo json_encode($hwIndividualCollection);
    }
    
    function homework_aggregated()
    {
    	global $db, $PLACEWEB_CONFIG, $problems_array, $equations_array;
    	
    	echo "still working on this one, needs a bit of data massage ;)";
    }
?>