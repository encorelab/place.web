<?php

/**
 * EloNode
 * This class represents a node entity in a directed-force viz using JIT libs
 */
class EloNode
{
    public $adjacencies = array();
    public $data = array();
    public $id;
    public $name;
    
    public function __construct()
    {
    	// empty for now...
    }
    
    /**
     * Adds adjacencent child to the current node
     * @param Adjacency $adjacencyObject
     */
    public function addAdjacency($adjacencyObject)
    {
    	$this->adjacencies[]=$adjacencyObject;
    }

    /**
     * Sets an attribute in the data array of parent node
     * @param String $attName
     * @param String $attValue
     */
    public function setDataAttribute($attName, $attValue)
    {
    	$this->data[$attName] = $attValue;
    }
} // end class
?>