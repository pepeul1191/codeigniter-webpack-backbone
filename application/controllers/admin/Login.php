<?php

class Login extends CI_Controller
{
  public function index()
  {
    // libraries as filters
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
    $data = array(
      'title' => 'Bienvenido',
      'csss' => access_css($this->config),
      'jss' => access_js($this->config),
      'message' => '',
      'message_color' => '',
      'config' => $this->config,
    );
    // render view
    $this->load->view('layouts/blank_header', $data);
    $this->load->view('admin/login/index');
    $this->load->view('layouts/blank_footer', array());
  }

  public function access()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    /*
    $this->load->library('ViewSessionFalse', array(
      'config' => $this->config,
    ));
    */
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['POST'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    // controller function
    $user = $this->input->post('user');
    $password = $this->input->post('password');
    if(
      $user == $this->config->item('login')['user'] && 
      $password == $this->config->item('login')['password']
    ){
      // set session
      $this->session->user = $user;
      $this->session->state = true;
      $this->session->time = date('Y-m-d H:i:s');
      // go to home???
      header('Location: ' . $this->config->item('base_url'));
      exit();
    }else{
      // load helpers
      $this->load->helper('admin/Login');
      $this->load->helper('View');
      // data to view
      $data_top = array(
        'title' => 'Bienvenido',
        'csss' => access_css($this->config),
        'jss' => access_js($this->config),
        'message' => 'Usuario y/o contraseña no coincide',
        'message_color' => 'has-danger',
        'config' => $this->config,
      );
      // render view
      $this->load->view('layouts/blank_header', $data_top);
      $this->load->view('admin/login/index');
      $this->load->view('layouts/blank_footer', array());
    }
  }
}

?>
