<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use Symfony\Component\Yaml\Yaml;

if ( ! function_exists('get_content'))
{
  function get_content($language, $file)
  {
    return Yaml::parseFile(__DIR__ . '/../contents/' . $file . '.yml')[$language];
  }
}