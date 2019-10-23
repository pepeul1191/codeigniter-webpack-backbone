<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('home_css'))
{
  function home_css($config)
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

if ( ! function_exists('home_js'))
{
  function home_js($config)
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
          'dist/admin.vendor.min',
          'dist/admin.min',
        ];
        break;
    }
    return $rpta;
  }
}

?>
