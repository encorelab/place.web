<?php

/**
 * The Adjacency object does not contain the id or name of the new node.
 * By providing an id to the "nodeTo" the node is automatically created. 
 * Note that in the data array, it is not allowed to provide vars such as $type, $color, etc.  
 * All the allowed metadata here seems to be only the user-generated; 
 * for instance, it's not allowed  to set any pre-defined var in the JIT lib 
 * ??? ANTO: need to research this a bit more...
 * @author anto
 */
class EloNodeAdjacency
{
	public $nodeTo;
	public $nodeFrom;
	public $data = array();

    /**
     * 
     * Enter description here ...
     * @param String $nodeTo
     * @param String $nodeFrom
     * @param array $data
     */
	public function __construct($nodeTo, $nodeFrom)
    {
    	$this->nodeTo = $nodeTo;
    	$this->nodeFrom = $nodeFrom;
    }
    
    public function setDataAttribute($attName, $attValue)
    {
    	$this->data[$attName] = $attValue;
    }
	
}
?>