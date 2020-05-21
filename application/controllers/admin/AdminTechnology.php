<?php

class AdminTechnology extends CI_Controller
{
  public function list()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['GET'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $rs = \Model::factory('\Models\Admin\Technology', 'coa')
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

  public function save()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['POST'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    //controller function
    $id = $this->input->post('id');
    $name = $this->input->post('name');
    $image = $this->input->post('image');
    $description = $this->input->post('description');
    $url = $this->input->post('url');
    $resp_data = '';
    $status = 200;
    try {
      if($id == 'E'){
        // new
        $n = \Model::factory('\Models\Admin\Technology', 'coa')->create();
        $n->name = $name;
        $n->image = $image;
        $n->description = $description;
        $n->url = $url;
        $n->save();
        $resp_data = $n->id;
      }else{
        // edit
        $e = \Model::factory('\Models\Admin\Technology', 'coa')->find_one($id);
        $e->name = $name;
        $e->image = $image;
        $e->description = $description;
        $e->url = $url;
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

  public function get()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['GET'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $rs = \Model::factory('\Models\Admin\Technology', 'coa')
        ->select('id')
        ->select('name')
        ->select('description')
        ->select('image')
        ->select('url')
        ->where('id', $this->input->get('id'))
        ->find_one();
      if($rs == false){
        $rpta = json_encode(['ups', 'Tecnología no encontrada']);
        $status = 404;
      }else{
        $rs = $rs->as_array();
        $rpta = json_encode($rs);
      }
    }catch (Exception $e) {
      $status = 500;
      $rpta = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($rpta);
  }

  public function delete()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['POST'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
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
			    $d = \Model::factory('\Models\Admin\Technology', 'coa')->find_one($delete);
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

  public function imageList()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['GET'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $rs = \Model::factory('\Models\Admin\VWTechnologyImage', 'coa')
        ->select('id')
        ->select('url')
        ->select('alt')
        ->where('technology_id', intval($this->input->get('id')))
        ->find_array();
      for($i = 0; $i < count($rs); $i++){
        $rs[$i]['url'] = $this->config->item('static_url') . $rs[$i]['url'];
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

  public function imageSave()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['POST'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    //controller function
    \ORM::get_db('coa')->beginTransaction();
    $data = json_decode($this->input->post('data'));
		$news = $data->{'new'};
		$edits = $data->{'edit'};
    $deletes = $data->{'delete'};
    $technology_id = $data->{'extra'}->{'technology_id'};
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
          $n_ti = \Model::factory('\Models\Admin\TechnologyImage', 'coa')->create();
          $n_ti->image_id = $n->id;
          $n_ti->technology_id = $technology_id;
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
          $ti = \Model::factory('\Models\Admin\TechnologyImage', 'coa')
            ->where('image_id', $delete)
            ->find_one();
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
}

?>
