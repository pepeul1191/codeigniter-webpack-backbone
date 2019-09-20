<?php

class AdminIndex extends CI_Controller
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
    $this->load->helper('admin/index');
    $this->load->helper('View');
    // controller function
    $data = array(
      'title' => 'Administración del Sitio',
      'csss' => index_css($this->config),
      'jss' => index_js($this->config),
      'config' => $this->config,
    );
    // render view
    $this->load->view('layouts/app_header', $data);
    $this->load->view('admin/index/index');
    $this->load->view('layouts/app_footer', array());
  }
}

?>
