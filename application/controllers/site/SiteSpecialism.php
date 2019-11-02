<?php

class SiteSpecialism extends CI_Controller
{
  public function list()
  {
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $rs = \Model::factory('\Models\Admin\Specialism', 'coa')
        ->select('id')
        ->select('name')
        ->find_array();
      $rpta = json_encode($rs);
    }catch (Exception $e) {
      $status = 500;
      $rpta = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($rpta);
  }
}

?>