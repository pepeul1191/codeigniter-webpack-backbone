<?php

class AdminDentist extends CI_Controller
{
  public function save()
  {
    // load session
    $this->load->library('session');
    //libraries as filters
    /// TODO
    //controller function
    $id = $this->input->post('id');
    $name = $this->input->post('name');
    $cop = $this->input->post('cop');
    $rne = $this->input->post('rne');
    $image = $this->input->post('image');
    if($image == ''){
      $image = 'asstes/img/default-user.png';
    }
    $resp_data = '';
    $status = 200;
    try {
      if($id == 'E'){
        // new
        $n = \Model::factory('\Models\Admin\Dentist', 'coa')->create();
        $n->name = $name;
        $n->cop = $cop;
        $n->rne = $rne;
        $n->image = $image;
        $n->save();
        $resp_data = $n->id;
      }else{
        // edit
        $e = \Model::factory('\Models\Admin\Dentist', 'coa')->find_one($id);
        $e->name = $name;
        $e->cop = $cop;
        $e->rne = $rne;
        $e->image = $image;
        $e->save();
      }
    }catch (Exception $e) {
      $status = 500;
      $resp_data = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($resp_data);
  }

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
      $rs = \Model::factory('\Models\Admin\Dentist', 'coa')
        ->select('id')
        ->select('name')
        ->select('cop')
        ->select('rne')
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
