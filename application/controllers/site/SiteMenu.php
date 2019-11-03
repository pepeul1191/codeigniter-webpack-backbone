<?php

class SiteMenu extends CI_Controller
{
  public function get()
  {
    //controller function
    $resp = '';
    $status = 200;
    try {
      $branches = \Model::factory('\Models\Admin\Branch', 'coa')
        ->select('id')
        ->select('name')
        ->select('branch_type_id')
        ->find_array();
      $technologies = \Model::factory('\Models\Admin\Technology', 'coa')
        ->select('id')
        ->select('name')
        ->find_array();
      $resp = json_encode(array(
        'branches' => $branches,
        'technologies' => $technologies,
      ));
    }catch (Exception $e) {
      $status = 500;
      $resp = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($resp);
  }
}

?>