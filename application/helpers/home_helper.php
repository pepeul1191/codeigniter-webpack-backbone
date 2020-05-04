<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('home_css'))
{
  function home_css($config)
  {
    $rpta = null;
    switch($config->item('env_static')){
      case 'dev':
        $rpta = [
          'bower_components/font-awesome/css/font-awesome.min',
          'dist/site.vendor',
          'dist/site',
        ];
        break;
      case 'prod':
        $rpta = [
          'bower_components/font-awesome/css/font-awesome.min',
          'dist/site.vendor',
          'dist/site',
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
          'dist/site.vendor',
          'dist/site',
        ];
        break;
      case 'prod':
        $rpta = [
          'dist/admin.vendor.min',
          'dist/site.vendor.min',
          'dist/site.min',
        ];
        break;
    }
    return $rpta;
  }
}

?>
