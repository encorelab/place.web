<?php
// Make sure to see http://www.pikopong.com/blog/2010/10/14/how-to-setup-example-application-from-zend-framework-a-beginners-guide-book/
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    protected function _initPaths()
    {
        // Define path to application directory
        defined('APPLICATION_PATH') || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

        // Define application environment, (I am only running this in development)
        //define('APPLICATION_ENV', 'development');
    }
    
    protected function _initDoctrine()  
      {
         $manager = Doctrine_Manager::getInstance();
          
            // configure Doctrine
            $manager->setAttribute(Doctrine_Core::ATTR_AUTO_ACCESSOR_OVERRIDE, true);			// forces Doctrine to load the model classes (non-base)
            $manager->setAttribute(Doctrine_Core::ATTR_AUTOLOAD_TABLE_CLASSES, true);			// forces Doctrine to load the table classes
            $manager->setAttribute(Doctrine_Core::ATTR_MODEL_LOADING, Doctrine_Core::MODEL_LOADING_CONSERVATIVE);		// loads data models lazyly 
            $manager->setAttribute(Doctrine_Core::ATTR_USE_NATIVE_ENUM, true);					// uses the native ENUM type in DB, not a varchar
            $manager->setAttribute(Doctrine_Core::ATTR_IDXNAME_FORMAT, '%s_idx');				// uses that format for creating indexes during migration          

         $config = $this->getOption('doctrine');
         $conn = Doctrine_Manager::connection($config['dsn'], 'main');
          
          Doctrine_Core::loadModels(MODELS_PATH);
          
         return $conn;
      }

      protected function _initRoutes()
      {
        $front = Zend_Controller_Front::getInstance();
        $router = $front->getRouter();
        $restRoute = new Zend_Rest_Route($front, array(), array('api'));
        $router->addRoute('api', $restRoute);  
      }

      protected function _initCache()
      {
        // $this->bootstrap('cachemanager');
        // $manager = $this->getResource('cachemanager');
        // $memoryCache = $manager->getCache('memory');
        // Zend_Locale::setCache($memoryCache);
        // Zend_Translate::setCache($memoryCache);      
      }
}

