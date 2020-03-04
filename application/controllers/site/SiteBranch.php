<?php

class SiteBranch extends CI_Controller
{
  public function list()
  {
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
    // libraries as filters
    // ???
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $branch_type_id = $this->input->get('branch_type_id');
      $branch_url = $this->input->get('url');
      $rs = null;
      $detail = \Model::factory('\Models\Admin\Branch', 'coa')
        ->where('branch_type_id', $branch_type_id)
        ->where('url', $branch_url)
        ->find_one();
      if($detail != false){
        $images = \Model::factory('\Models\Admin\VWBranchImage', 'coa')
          ->where('branch_id', $detail->id)
          ->find_array();
        $directorModel = \Model::factory('\Models\Admin\Dentist', 'coa')
          ->where('id', $detail->director_id)
          ->find_one();
        $director = null;
        if($directorModel != false){
          $director = array(
            'name' => $directorModel->name,
            'cop' => $directorModel->cop,
            'rne' => $directorModel->rne,
            'image' => $directorModel->image,
          );
        }
        $rs = array(
          'detail' => array(
            'name' => $detail->name,
            'address' => $detail->address,
            'phone' => $detail->phone,
            'whatsapp' => $detail->whatsapp,
            'emergency' => $detail->emergency,
            'image' => $detail->image,
            'latitude' => $detail->latitude,
            'longitude' => $detail->longitude,
          ),
          'images' => $images,
          'director' => $director,
        );
      }
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
