<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ViewSessionTrue
{
  function __construct($params)
  {
    $continuar = true;
		if($params['config']->item('env_session') == true){
      if ($params['session']->has_userdata('state')) {
        if($params['session']->has_userdata('state') != true){
          $continuar = false;
        }
      }else{
        $continuar = false;
      }
      if($continuar == false){
        header('Location: ' . $params['config']->item('base_url') . 'error/access/505');
        exit();
      }
    }
  }
}
