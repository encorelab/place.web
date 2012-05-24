<?php
include('../../application/configs/config.php');
include('sql_config.php');

$debugON=true;

/*
 * get type  
 */
if(isset($_REQUEST['t']))
{
	$dataType=$_REQUEST['t'];
} else {
	$dataType="";
}

include('../../application/configs/config.php');

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

/* 
 * loading assets form NEOplace
 */
$problems = file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/problems.json');
$problems_array = json_decode($problems, true);
$equations = file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/equations.json');
$equations_array = json_decode($equations, true);
//print_r($problems_array);
//print_r($equations_array);

/*
 * !!!
 * We need to have a list of Mike's principles set in rollcall metadata, 
 * key for future data analysis is to keep track of ids in old place
 * And, deal with the changes in the names. e.g. "Newton 1st Law" in old place, id=2, is now set as "Newton's First Law", etc. 
 */
$principles_array = array(
	"Newton's Second Law",
	"Newton's Third Law",
	"Acceleration",
	"Kinetic Friction ",
	"Static Friction",
	"Fnet = 0",
	"Fnet = constant",
	"Vectors",
	"Kinetic Energy",
	"Potent Energy",
	"Conservation of Energy",
	"Work"
);

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
		
		$homework = mysql_query($sql, $db) or die('An error happened');

		$hwIndividualCollection = array();
		
		//while ($hw = mysql_fetch_array($result, MYSQL_ASSOC))
		while(($hw=mysql_fetch_assoc($homework)) != null) 
		{
			//print_r($hw);
			
			// clean up space after comma
			$cleaned_db_principles = trim($hw['principles']);
			$cleaned_db_principles = str_replace(', ', ',', $cleaned_db_principles);
			
			$probPrinciplesNames = explode(",", $cleaned_db_principles);
			$probEquationsIs = explode(",", $hw['equations']);

			$probPrinciplesInTargetFormat = array();
			$probEquationsInTargetFormat = array();

			foreach($probPrinciplesNames as $pn)
			{
				// some clean up
				$pn = stripcslashes($pn);
				$pn=trim($pn);
			
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
    	global $db, $PLACEWEB_CONFIG, $problems_array, $equations_array, $principles_array, $debugON;
    	
    	$hwAggregatedCollection = array();
	
    	/*
    	 * 1. loop problems [NEOplace assets]
    	 */
    	foreach ($problems_array as $problem)
    	{
    		if($debugON)
    		{
				echo '<hr/>';
	    		echo '<h1>'.$problem['name'].'</h1>';
    		}

    		$problemName = $problem["name"];
    		
    		$problemPrincipleCount = 0;
    		$problemEquationCount = 0;
    		
    		$problemPrinciplesArray = array();
    		$problemEquationsArray = array();
    		
			/*
			 * 2. loop principles 
			 */
			foreach($principles_array as $principle)
			{
				$problemPrincipleCount=0;
				
				// escape ' chr
				$principle = str_replace("'", "\'", $principle); 
				
	    		/*
	    		 * count records: for given principle and problem name
	    		 */
	    		$sql_p = "SELECT id FROM smartroom_hw WHERE problem_name='".$problem["name"]."' AND principles LIKE '%".$principle."%'";
	    		
	    		$homework_p = mysql_query($sql_p, $db) or die('An error happened on principle: '.$principle);
				$problemPrincipleCount = mysql_num_rows($homework_p);
				
				if($debugON)
				{
					echo '<br/>Principle Name: '.$principle;
					echo '<br/>count: '.$problemPrincipleCount;
				}
				// create problem principles array
				$thisPrincipleArray= array(
					"name"=>$principle,
					"count"=>$problemPrincipleCount
				);

				// add only if not 0
				if($problemPrincipleCount!=0)
				{
					$problemPrinciplesArray[] = $thisPrincipleArray;
				}
				
			} // end foreach principles

			if($debugON)
			{
				echo '<hr/>';
			}
			/*
			 * 3. loop equations 
			 */
			for ($i=0;$i<count($equations_array);$i++)
			{
				$problemEquationCount=0;

				$eqName = $equations_array[$i]['name'];
				
				// index = EQ_ID - 1
				// EQ_ID = index + 1
				$EQ_ID = $i+1;

	    		/*
	    		 * count records: for given equation id and problem name
	    		 */
	    		$sql_eq = "SELECT id FROM smartroom_hw WHERE problem_name='".$problem["name"]."' AND equations LIKE '%".$EQ_ID."%'";
				$homework_eq = mysql_query($sql_eq, $db) or die('An error happened on equation ID: '.$EQ_ID);
				$problemEquationCount = mysql_num_rows($homework_eq);
				
				if($debugON)
				{
					echo '<br/>Equation ID: '.$EQ_ID;
					//echo '<br/>Equation idx: '.$i;
					//echo '<br/>Equation Name: '.$eqName;
					echo '<br/>count: '.$problemEquationCount;
				}
				
				// create problem equation array
				$thisEquationsArray= array(
					"name"=>$eqName,
					"count"=>$problemEquationCount
				);
				
				// add only if not 0
				if($problemEquationCount!=0)
				{
					$problemEquationsArray[] = $thisEquationsArray;
				}
			} // end foreach equations

			
		// add to $hwAggregatedCollection
		$hwAggregatedCollection[]=array(
			"problemName"=>$problemName,
			"principles"=>$problemPrinciplesArray,
			"equations"=>$problemEquationsArray,
		
		);
		
    	} // end foreach problems 
			

		echo json_encode($hwAggregatedCollection);
    }
    
    function testJsonTarget()
    {
		global $db, $PLACEWEB_CONFIG, $problems_array, $equations_array;
    	
		$individual= file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/hw_individual.json');
    	$individual_array = json_decode($individual, true);
    	print_r($individual_array);
    	
    	echo '<hr>';
    	
		$agg= file_get_contents($PLACEWEB_CONFIG['assetsURL'].'/assets/hw_aggregated.json');
    	$agg_array = json_decode($agg, true);
    	print_r($agg_array );

    }
   // testJsonTarget();
?>