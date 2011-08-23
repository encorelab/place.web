<?php
/**
 * Why having an Entity?
 * 
 * The abstraction layer introduced by this entity may be an overhead
 * The justification is this:  
 * This entity defines a high-level for ANY entity that can be attached to the system.
 * 
 * One of the key advantages of a schemaless DB as Mongo is that entities can 
 * evovle: grow and srink; which means to transform the attributes 
 * and actually story anyting within a new attribute. 
 * 
 * The draw back of this is that when you retrive an entity, the controller may not know
 * how to deal with the date the is being retrieved. This is the "advantage" of a SQL model:
 * basically the programmer knows (and knows pretty well) about the data being retrived/stored/updated in the DB
 * 
 *  
 * So,
 * 
 * There are THINGS we want to track/know about the entities so that we know what "to expect" from each entity
 * 		for example, what can be 
 * 			a) attached/removed
 * 			b) how to interact with
 */
class Entity 
{
	public $id;
	public $name;
	public $structure = array(); // this will hold the name and type of each attribute. Plus, some additional validation rules.
	
	/**
	 * 
	 * Entity Constructor
	 * @param string $theId
	 * @param string $theName
	 * @param array $theStructure
	 */
	public function __construct($theName, $theStructure)
	{
		
	} // end constructor
	
	
} // end class

