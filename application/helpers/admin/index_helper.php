<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('index_css'))
{
  function index_css($config)
  {
    $rpta = null;
    switch($config->item('env_static')){
      case 'dev':
        $rpta = [
          'bower_components/font-awesome/css/font-awesome.min',
          'dist/admin.vendor',
          'dist/admin',
        ];
        break;
      case 'prod':
        $rpta = [
          'bower_components/font-awesome/css/font-awesome.min',
          'dist/admin.vendor',
          'dist/admin',
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
          'dist/admin.vendor',
          'dist/admin',
        ];
        break;
      case 'prod':
        $rpta = [
          'dist/admin.vendor',
          'dist/admin',
        ];
        break;
    }
    return $rpta;
  }
}

?>
