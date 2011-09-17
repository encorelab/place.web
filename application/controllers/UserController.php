<?php
class UserController extends Zend_Controller_Action
{
	private $params = array(); 		// parameters 
	private $authMethod = "";	// authentication method

    public function init()
    {
    	global $PLACEWEB_CONFIG;
		if(isset($PLACEWEB_CONFIG['authentication']))
		{
			$this->authMethod = $PLACEWEB_CONFIG['authentication'];
			//echo "<hr/>";
	    	//print_r($this->authMethod);
		}
    	
    	$params = $this->getRequest()->getParams();
    	$this->params = $params;
	    	//echo "<hr/>";
	    	//print_r($this->params); 
    }

    public function indexAction()
    {

    }
    
    public function loginAction()
    {
		
    	
    	if($this->authMethod == "local")
    	{
    		$this->localAuthentication();
    		
    	} else if ($this->authMethod == "rollCall") {
    		$this->rollCallAuthentication();
    		
    	} else {
    		echo "<p>No authentication method.</p>";
    	}
    	

    } // end loginAction()
    
    public function logoutAction()
    {

    } // end logoutAction()

    public function addAction()
    {
		// not implemented yet
    }

    public function changepasswordAction()
    {
    	// not implemented yet
    }
    
    private function localAuthentication()
    {
    	global $PLACEWEB_CONFIG;

    	print_r($this->params);
    	
		$q = Doctrine_Query::create()
		->select('e.*')
		->from('User e')
		->where('e.run_id = ? AND e.username = ?' , array(1, $this->params['username']))
		->orderBy('e.id DESC');
		$user = $q->fetchArray();
		//print_r($user);
		
    	$_SESSION['access'] = true;
    	$_SESSION['username'] = $user[0]['username']; 	// user.username
    	$_SESSION['profile'] = $user[0]['user_type']; 	// user.user_type
    	$_SESSION['run_id']=1; 		// user.run_id
    	$_SESSION['author_id'] = $user[0]['id']; // user.author_id
    	
    	header('Location: /myhome');
    	
    	//echo "<hr/>";
    	//echo "using local authentication ";;
    	
    	/*
    	 * 1) check username and password in user's table
    	 * 		if does not exist 
    	 * 			show error to the user
    	 * 			redirect to login page
    	 * 		else
    	 * 			set the following:
    	 *     		$_SESSION['access'] = true;
    	 *     		$_SESSION['username'] = "[the username]"; 	// user.username
    	 * 			$_SESSION['profile'] = "[the profile]"; 	// user.user_type
    	 * 			$_SESSION['run_id']="[the run_id]"; 		// user.run_id
    	 * 			$_SESSION['author_id'] = [user.author_id]	// user.author_id
    	 */
    } // end localAuthentication()
    
    private function rollCallAuthentication()
    {
    	echo "<hr/>";
    	echo "using rollCall authentication";;
		/*
    	require 'PestXML.php';
		$rollcall_site_url = "http://rollcall.proto.encorelab.org/:3000";
		$rest = new PestXML($rollcall_site_url);
		*/
    	
    	
    	
    	// get json
    	
    	// convert array
    	
    	
    	
    	/*
    	 * 1) send username and passw to rollcall
    	 * 2) get rollcall response (JSON?)
    	 * 3) analyze the response
    	 * 4) if username and password are OK set the following:
    	 *     	$_SESSION['access'] = true;
    	 *     	$_SESSION['username'] = "[the username]";
    	 * 		$_SESSION['profile'] = "[the profile]"; // (e.g. TEACHER, STUDENT)
    	 * 		$_SESSION['run_id']="[the run_id]";
    	 * 5) insert/check the user exist in table user
    	 * 6) set 
    	 * 		$_SESSION['author_id'] = [user.author_id]
    	 */
    } // end rollCallAuthentication()
    
} // end class

