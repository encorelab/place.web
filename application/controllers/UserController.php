<?php
class UserController extends Zend_Controller_Action
{
	private $params = array(); 		// parameters 
	private $authMethod = "";		// authentication method

    public function init()
    {
    	global $PLACEWEB_CONFIG;
    	
		if(isset($PLACEWEB_CONFIG['authentication']))
		{
			$this->authMethod = $PLACEWEB_CONFIG['authentication'];
		}
    	
    	$params = $this->getRequest()->getParams();
    	$this->params = $params;
    }

    public function indexAction()
    {
		
    }
    
    public function loginAction()
    {
    	global $PLACEWEB_CONFIG;
    	
    	/**
    	 * Antonio commented this, please set this in config.php
    	 * $PLACEWEB_CONFIG['authentication'] = "rollCall";
    	 * 
    	 */
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
		Zend_Session::destroy();
		
		return $this->_helper->redirector('index', 'index');
		
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
    	
        $username = $this->params['username'];
        $password = $this->params['password'];
		
		$localUser = Doctrine::getTable('User')->findByDql("username = ?", $username);
		$localUser = $localUser[0];
		
		$localUser->last_login = date( 'Y-m-d H:i:s');
		$localUser->save();
		
        $_SESSION['access'] = true;
    	$_SESSION['username'] = $localUser->username;
    	$_SESSION['profile'] = $localUser->user_type;
    	$_SESSION['run_id'] = 1;
    	$_SESSION['user_display_name'] = $localUser->display_name;
    	$_SESSION['author_id'] = $localUser->id;
    	$_SESSION['group_name'] = $localUser->group_name;
			
        header('Location: /myhome');
    } // end localAuthentication()
    
    private function rollCallAuthentication()
    {   
    	global $PLACEWEB_CONFIG;
    	
        $username = $this->params['username'];
        $password = $this->params['password'];
        
        $authJson = @file_get_contents($PLACEWEB_CONFIG['rollCallUrl']."/users/$username.json");
        // if request was successful (ie user exists)
        if ($authJson){
            $auth = Zend_Json::decode($authJson);

            $realPasswordSha1="";
            
            	//$realPassword = $auth['user']['account']['password'];
            // authenticate using encrypted-password
           	$realPasswordSha1 = $auth['user']['account']['encrypted_password'];
 
            
            //if ($realPassword == $password){
            if ($realPasswordSha1 == sha1($password)) {
                // OK to login
                // Fetch the User from local DB
                $localUser = Doctrine::getTable('User')->findByDql("username = ?", $username);
                
                // get the rollcall runId from auth
                $userRunId = 1;
                $userGroupName = "";
                if (isset($auth['user']['groups'])){
                    $group = $auth['user']['groups'][0];
                    $userRunId = $group['run_id'];
                    $userGroupName = $group['name'];
                }
                
                // get the Run based on rollcall runId
                $run = Doctrine::getTable('Run')->findByDql("name = ?", array($userGroupName));
                $run = $run[0];
                
                // Create the user if it doesn't exist in local DB
                if (count($localUser) == 0){
                    echo "creating user";
                    
                    $localUser = new User();
                    $localUser->run_id = $run->id;
                    $localUser->author_id = 0;
                    $localUser->date_created = date( 'Y-m-d H:i:s');

                    $localUser->display_name = $auth['user']['display_name'];
                    $localUser->group_name=$userGroupName;
                    $localUser->username = $username;
                    
                    //$localUser->password = $password;
                    
                    // change "Instructor" to "TEACHER"
                    if($auth['user']['kind']=="Instructor")
                    {
                    	$localUser->user_type = "TEACHER";
                    } else {
                    	$localUser->user_type = strtoupper($auth['user']['kind']);
                    }
                    
                    $localUser->save();

                }else{
                    $localUser = $localUser[0];
                }

				$localUser->last_login = date( 'Y-m-d H:i:s');
				$localUser->save();

                // setup session 
                $_SESSION['access'] = true;
            	$_SESSION['username'] = $localUser->username;
            	$_SESSION['profile'] = $localUser->user_type;
            	$_SESSION['run_id'] = $run->id;
            	$_SESSION['user_display_name'] = $auth['user']['display_name'];
            	$_SESSION['author_id'] = $localUser->id;
            	$_SESSION['group_name'] = $localUser->group_name;
					
                header('Location: /myhome');
            	
            }else{
                echo "wrong password";
            }
        }else{
            echo "user not found";
        }
    } // end rollCallAuthentication()
    
} // end class