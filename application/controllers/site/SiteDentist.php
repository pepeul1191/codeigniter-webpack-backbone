<?php

class SiteDentist extends CI_Controller
{
  public function search()
  {
    // ???
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $rs = array();
      $stmt = \Model::factory('\Models\Admin\VWDentistBrancheSpecialism', 'coa')
        ->select('dentist_id', 'id')
        ->select('dentist_name', 'name')
        ->select('cop')
        ->select('image')
        ->select('rne');
      // filter name
      if(
        $this->input->get('name') != null
      ){
        $stmt = $stmt->where_like('dentist_name', '%' . $this->input->get('name') . '%');
      }
      // filter specialism
      if(
        $this->input->get('specialism_id') != null
      ){
        if(
          $this->input->get('specialism_id') == 'E'
        ){
          $stmt = $stmt->where('specialism_id', 1);
        }else{
          $stmt = $stmt->where('specialism_id', $this->input->get('specialism_id')); 
        }
      }
      // filter branch
      if(
        $this->input->get('branch_id') != null
      ){
        if(
          $this->input->get('branch_id') == 'E'
        ){
          $stmt = $stmt->where('branch_id', 1);
        }else{
          $stmt = $stmt->where('branch_id', $this->input->get('branch_id')); 
        }
      }
      // pages with final statement
      $pages = ceil(
        $stmt->count()
        / $this->input->get('step')
      );
      // pagination
      if(
        $this->input->get('step') != null && 
        $this->input->get('page') != null
      ){
        $offset = ($this->input->get('page') - 1) * $this->input->get('step');
        $stmt = $stmt->offset($offset)->limit($this->input->get('step'));
      }
      $rs = $stmt->find_array();
      $rpta = json_encode(array(
        'list' => $rs,
        'pages' => $pages,
      ));
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