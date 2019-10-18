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

  public function save()
  {
    // load session
    $this->load->library('session');
    //libraries as filters
    /// TODO
    //controller function
    $id = $this->input->post('id');
    $name = $this->input->post('name');
    $image = $this->input->post('image');
    $address = $this->input->post('address');
    $branch_type_id = $this->input->post('branch_type_id');
    $director_id = $this->input->post('director_id');
    $emergency = $this->input->post('emergency');
    $latitude = $this->input->post('latitude');
    $longitude = $this->input->post('longitude');
    $phone = $this->input->post('phone');
    $whatsapp = $this->input->post('whatsapp');
    if($image == ''){
      $image = 'assets/img/default-branch.png';
    }
    $resp_data = '';
    $status = 200;
    try {
      if($id == 'E'){
        // new
        $n = \Model::factory('\Models\Admin\Branch', 'coa')->create();
        $n->name = $name;
        $n->image = $image;
        $n->address = $address;
        $n->branch_type_id = $branch_type_id;
        $n->director_id = $director_id;
        $n->emergency = $emergency;
        $n->latitude = $latitude;
        $n->longitude = $longitude;
        $n->phone = $phone;
        $n->whatsapp = $whatsapp;
        $n->save();
        $resp_data = $n->id;
      }else{
        // edit
        $e = \Model::factory('\Models\Admin\Branch', 'coa')->find_one($id);
        $e->name = $name;
        $e->image = $image;
        $e->address = $address;
        $e->branch_type_id = $branch_type_id;
        $e->director_id = $director_id;
        $e->emergency = $emergency;
        $e->latitude = $latitude;
        $e->longitude = $longitude;
        $e->phone = $phone;
        $e->whatsapp = $whatsapp;
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

  public function imageSave()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //controller function
    \ORM::get_db('coa')->beginTransaction();
    $data = json_decode($this->input->post('data'));
		$news = $data->{'new'};
		$edits = $data->{'edit'};
    $deletes = $data->{'delete'};
    $branch_id = $data->{'extra'}->{'branch_id'};
    $created_ids = [];
    $resp_data = '';
    $status = 200;
    try {
      // news
      if(count($news) > 0){
				foreach ($news as &$new) {
				  $n = \Model::factory('\Models\Admin\Image', 'coa')->create();
          $n->alt = $new->{'alt'};
          $n->url = $new->{'url'};
					$n->save();
				  $temp = [];
				  $temp['tempId'] = $new->{'id'};
	        $temp['newId'] = $n->id;
	        array_push( $created_ids, array(
            'tempId' => $new->{'id'},
            'newId' => $n->id,
          ));
          $n_ti = \Model::factory('\Models\Admin\BranchImage', 'coa')->create();
          $n_ti->image_id = $n->id;
          $n_ti->branch_id = $branch_id;
          $n_ti->save();
				}
      }
      // edits
      if(count($edits) > 0){
				foreach ($edits as &$edit) {
          $e = \Model::factory('\Models\Admin\Image', 'coa')->find_one($edit->{'id'});
          $e->alt = $edit->{'alt'};
          $e->url = $edit->{'url'};
					$e->save();
        }
      }
      // deletes
      if(count($deletes) > 0){
				foreach ($deletes as &$delete) {
          $ti = \Model::factory('\Models\Admin\BranchImage', 'coa')-find_one('image_id', $delete);
          $ti->delete();
			    $d = \Model::factory('\Models\Admin\Image', 'coa')->find_one($delete);
			    $d->delete();
				}
      }
      // commit
      \ORM::get_db('coa')->commit();
      // response data
      $resp_data = json_encode($created_ids);
    }catch (Exception $e) {
      $status = 500;
      $resp_data = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($resp_data);
  }

  public function delete()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //controller function
    \ORM::get_db('coa')->beginTransaction();
    $data = json_decode($this->input->post('data'));
    $deletes = $data->{'delete'};
    $created_ids = [];
    $resp_data = '';
    $status = 200;
    try {
      // deletes
      if(count($deletes) > 0){
				foreach ($deletes as &$delete) {
			    $d = \Model::factory('\Models\Admin\Branch', 'coa')->find_one($delete);
			    $d->delete();
				}
      }
      // commit
      \ORM::get_db('coa')->commit();
      // response data
      $resp_data = json_encode(array());
    }catch (Exception $e) {
      $status = 500;
      $resp_data = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($resp_data);
  }
}

?>