<?php

class SiteTechnology extends CI_Controller
{
  public function search()
  {
    // libraries as filters
    // ???
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $technology_name = $this->input->get('name');
      $technology_name = str_replace('-', ' ', $technology_name); 
      $rs = null;
      $detail = \Model::factory('\Models\Admin\Technology', 'coa')
        ->where('name', $technology_name)
        ->find_one();
      if($detail != false){
        $images = \Model::factory('\Models\Admin\VWTechnologyImage', 'coa')
          ->where('technology_id', $detail->id)
          ->find_array();
        $rs = array(
          'detail' => array(
            'name' => $detail->name,
            'description' => $detail->description,
            'image' => $detail->image,
          ),
          'images' => $images,
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
