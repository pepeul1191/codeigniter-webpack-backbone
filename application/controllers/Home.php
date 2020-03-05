<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
  public function index()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // load helpers
    $this->load->helper('home');
    // controller function
    $data = array(
      'title' => 'Centro Odontológico Americano',
      'csss' => home_css($this->config),
      'jss' => home_js($this->config),
      'config' => $this->config,
    );
    // render view|
    $this->load->view('home', $data);
  }
}
