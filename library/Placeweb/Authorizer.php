<?php
class Placeweb_Authorizer {
	
	/**
	 * $userProfile is a user.user_profile value or empty if any 
	 * logged in user can have access to the page
	 *
	 */
	public static function authorize($userProfile=false){
		$params = Zend_Controller_Front::getInstance()->getRequest()->getParams();
		$controller = $params['controller'];
		$action = $params['action'];
		
		$isLoggedIn = isset($_SESSION['access']) && $_SESSION['access'];
		
		if ($isLoggedIn){
			if (!$userProfile){
				// allow page request
			}else{
				if ($userProfile != $_SESSION['profile']){
					// echo "redirect to /user/logout";
					header('Location: /user/logout');
					exit();
				}else{
					// allow page request
				}
			}
		}else{
			if ($controller != 'index'){
				header('Location: /');
				exit();
			}else{
				// allow page request
			}
		}
	}
}