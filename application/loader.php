<?php
// path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Models' path
defined('MODELS_PATH')
    || define('MODELS_PATH', (getenv('MODELS_PATH') ? getenv('MODELS_PATH') : APPLICATION_PATH.'/models'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));




/** Zend_Application */
require_once 'Zend/Application.php';

$application = new Zend_Application(
    APPLICATION_ENV,
    APPLICATION_PATH . '/configs/application.ini'
);


/** Doctrine Loader */
require_once 'Doctrine/Doctrine.php';
$application->getAutoloader()
            ->pushAutoloader(array('Doctrine', 'autoload'), 'Doctrine');

$autoloader = Zend_Loader_Autoloader::getInstance();
$autoloader->pushAutoloader(array('Doctrine_Core', 'modelsAutoload'));

require_once(APPLICATION_PATH.'/configs/config.php');
require_once(APPLICATION_PATH.'/layouts/include/'.'security.inc.php');
