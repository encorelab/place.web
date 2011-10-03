<?php

/**
 * EloD3
 * 
 * This class represents a node entity in D3

 */
class EloD3 
{
    public $id;
    public $type; // (e.g. example, question, tag, etc...)
    public $name;
    public $data = array();
    public $children = array();
    
    public function __construct()
    {
    
    }
    
    /**
     * 
     * Adds a child to a specific elo
     * @param String $id
     * @param EloD3 $eloObject
     */
    public function addChild($id, $eloObject)
    {
    	$this->children[]=$eloObject;
    }

}