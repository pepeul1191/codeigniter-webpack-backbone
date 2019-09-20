<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('index_css'))
{
  function index_css($config)
  {
    $rpta = null;
    switch($config->item('env_static')){
      case 'dev':
        $rpta = [
          'bower_components/bootstrap/dist/css/bootstrap.min',
          'bower_components/font-awesome/css/font-awesome.min',
          'assets/css/constants',
          'assets/css/styles',
          'assets/css/dashboard',
        ];
        break;
      case 'prod':
        $rpta = [
          'dist/login.min',
        ];
        break;
    }
    return $rpta;
  }
}

if ( ! function_exists('index_js'))
{
  function index_js($config)
  {
    $rpta = null;
    switch($config->item('env_static')){
      case 'dev':
        $rpta = [
        ];
        break;
      case 'prod':
        $rpta = [
        ];
        break;
    }
    return $rpta;
  }
}

?>
