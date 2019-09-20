<?php

class Login extends CI_Controller
{
  public function index()
  {
    
    //libraries as filters
    /*
    $this->load->library('ViewSessionFalse', array(
      'config' => $this->config,
    ));
    */
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['GET'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    // load helpers
    $this->load->helper('admin/Login');
    $this->load->helper('View');
    // controller function
    $data_top = array(
      'title' => 'Bienvenido',
      'csss' => access_css($this->config),
      'jss' => access_js($this->config),
      'mensaje' => '',
      'config' => $this->config,
    );
    // var_dump($this->config->item('csrf')['key']);exit();
    $this->load->view('layouts/blank_header', $data_top);
    $this->load->view('admin/login/index');
    $this->load->view('layouts/blank_footer', array());
  }
}

?>
