<?php
class UserController extends Zend_Controller_Action
{
	private $params = array(); 		// parameters 
	private $authMethod = "";	// authentication method

    public function init()
    {
    	global $PLACEWEB_CONFIG;
//    	print_r($PLACEWEB_CONFIG);
    	
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
    	//require_once(APPLICATION_PATH.'/configs/config.php');
    	
        $this->authMethod = "rollCall";
    	
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
		print_r($user);
		
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
        $username = $this->params['username'];
        $password = $this->params['password'];
        
        $authJson = @file_get_contents("http://rollcall.aardvark.encorelab.org/users/$username.json");
        // if request was successful (ie user exists)
        if ($authJson){
            $auth = Zend_Json::decode($authJson);
            $realPassword = $auth['user']['account']['password'];
            
            if ($realPassword == $password){
                // OK to login
                // Fetch the User from local DB
                $localUser = Doctrine::getTable('User')->findByDql("username = ?", $username);
                
                // Create the user if it doesn't exist in local DB
                if (count($localUser) == 0){
                    echo "creating user";
                    
                    $localUser = new User();
                    $localUser->run_id = 1;
                    $localUser->author_id = 0;
                    $localUser->date_created = date( 'Y-m-d H:i:s');
                    $localUser->username = $username;
                    $localUser->password = $password;
                    $localUser->user_type = strtoupper($auth['user']['kind']);
                    $localUser->save();

                }else{
                    $localUser = $localUser[0];
                }
                
                $_SESSION['access'] = true;
            	$_SESSION['username'] = $localUser->username;
            	$_SESSION['profile'] = $localUser->user_type;
            	$_SESSION['run_id'] = 1;
            	$_SESSION['author_id'] = 0;

                header('Location: /myhome');
            	
            }else{
                echo "wrong password";
            }
        }else{
            echo "user not found";
        }
    } // end rollCallAuthentication()
    
} // end class

