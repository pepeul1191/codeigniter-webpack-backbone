<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('access_css'))
{
  function access_css($config)
  {
    $rpta = null;
    switch($config->item('env_static')){
      case 'dev':
        $rpta = [
          'dist/login.vendor',
          'dist/login',
        ];
        break;
      case 'prod':
        $rpta = [
          'dist/login.vendor.min',
          'dist/login.min',
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
