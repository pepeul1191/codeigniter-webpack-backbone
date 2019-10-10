<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('access_css'))
{
  function access_css($config)
  {
    $rpta = null;
    switch($config->item('env_static')){
      case 'dev':
        $rpta = [
          'bower_components/font-awesome/css/font-awesome.min',
          /*'bower_components/bootstrap/dist/css/bootstrap.min',
          'assets/css/constants',
          'assets/css/error',*/
          'dist/error.vendor',
          'dist/error',
        ];
        break;
      case 'prod':
        $rpta = [
          'dist/error.min',
        ];
        break;
    }
    return $rpta;
  }
}

if ( ! function_exists('access_js'))
{
  function access_js($config)
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
