<?php

class AdminBranch extends CI_Controller
{
  public function list()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $branch_type_id = $this->input->get('branch_type_id');
      $rs = \Model::factory('\Models\Admin\Branch', 'coa')
        ->select('id')
        ->select('name')
        ->select('address')
        ->where('branch_type_id', $branch_type_id)
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

  public function search()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $name = $this->input->get('name');
      $rs = \Model::factory('\Models\Admin\VWBranchType', 'coa')
        ->select('id')
        ->select('name')
        ->where_like('name', '%' . $name . '%')
        ->limit(10)
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