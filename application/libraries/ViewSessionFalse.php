<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ViewSessionFalse
{
  function __construct($params)
  {
    $continuar = true;
		if($params['config']->item('env_session') == true){
      if ($params['session']->has_userdata('state')) {
        if($params['session']->has_userdata('state') == true){
          $continuar = false;
        }
      }else{
        $continuar = true;
      }
      if($continuar == false){
        header('Location: ' . $params['config']->item('base_url') . 'admin');
        exit();
      }
    }
  }
}
