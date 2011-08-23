<?php

// connect
$m = new Mongo();

// select a database
$db = $m->comedy;

//the cleanest way of getting a database.
	/*
		// the following two lines are equivalent
		$db = $mongo->selectDB("foo");
		$db = $mongo->foo;
	*/

// select a collection (analogous to a relational database's table)
$collection = $db->cartoons;

// add a record
$obj = array( "title" => "Calvin and Hobbes", "author" => "Bill Watterson" );
$collection->insert($obj);

// add another record, with a different "shape"
$obj = array( "title" => "XKCD", "online" => true );
$collection->insert($obj);

// find everything in the collection
$cursor = $collection->find();

// iterate through the results
foreach ($cursor as $obj) {
    echo $obj["title"] . "\n";
}

?>

