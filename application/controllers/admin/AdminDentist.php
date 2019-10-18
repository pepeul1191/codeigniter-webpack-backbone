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
      $image = 'assets/img/default-user.png';
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
      $pages = ceil(
        \Model::factory('\Models\Admin\Dentist', 'coa')->count()
        / $this->input->get('step')
      );
      $rs = array();
      if(
        $this->input->get('step') == null && 
        $this->input->get('page') == null
      ){
        $rs = \Model::factory('\Models\Admin\Dentist', 'coa')
        ->select('id')
        ->select('name')
        ->select('cop')
        ->select('rne')
        ->find_array();
      }else{
        $offset = ($this->input->get('page') - 1) * $this->input->get('step');
        $rs = \Model::factory('\Models\Admin\Dentist', 'coa')
        ->select('id')
        ->select('name')
        ->select('cop')
        ->select('rne')
        ->offset($offset)
        ->limit($this->input->get('step'))
        ->find_array();
      }
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
          // delete dentist specialism
          \Model::factory('\Models\Admin\DentistSpecialism', 'coa')
            ->where('dentist_id', $delete)
            ->delete_many();
          // delete dentist
			    $d = \Model::factory('\Models\Admin\Dentist', 'coa')->find_one($delete);
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

  public function get()
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
        ->select('rne')
        ->select('cop')
        ->select('image')
        ->where('id', $this->input->get('id'))
        ->find_one();
      if($rs == false){
        $rpta = json_encode(['ups', 'Odotólogo no encontrado']);
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

  public function specialismGet()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //controller function
    $rpta = '';
    $status = 200;
    try {
      $pdo = \ORM::get_db('coa');
      $query = '
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.exist = 1) THEN 1 ELSE 0 END) AS exist FROM
        (
          SELECT id, name, 0 AS exist FROM specialisms
        ) T 
        LEFT JOIN 
        (
          SELECT C.id, C.name, 1 AS exist FROM 
          specialisms C INNER JOIN dentists_specialisms TC ON
          C.id = TC.specialism_id
          WHERE TC.dentist_id = %d
        ) P 
        ON P.id = T.id
      ';
      $rs = array();
      foreach($pdo->query(sprintf($query, $this->input->get('id'))) as $row) {
        array_push($rs, array(
          'id' => $row['id'],
          'name' => $row['name'],
          'exist' => $row['exist'],
        ));
      }
      if($rs == false){
        $rpta = json_encode(['ups', 'Odotólogo no tiene especialidades asociadas']);
        $status = 404;
      }else{
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

  public function specialismSave()
  {
    // load session
    $this->load->library('session');
    // libraries as filters
    // ???
    //controller function
    \ORM::get_db('coa')->beginTransaction();
    $data = json_decode($this->input->post('data'));
		$edits = $data->{'edit'};
    $dentist_id = $data->{'extra'}->{'dentist_id'};
    $resp_data = '';
    $status = 200;
    try {
      // edits
      if(count($edits) > 0){
				foreach ($edits as &$edit) {
          $specialism_id = $edit->{'id'};
          $exist = $edit->{'exist'};
          $e = \Model::factory('\Models\Admin\DentistSpecialism', 'coa')
            ->where('specialism_id', $specialism_id)
            ->where('dentist_id', $dentist_id)
            ->find_one();
          if($exist == 0){
            if($e != false){
              $e->delete();
            }
          }else{
            if($e == false){
              $n = \Model::factory('\Models\Admin\DentistSpecialism', 'coa')->create();
              $n->specialism_id = $specialism_id;
              $n->dentist_id = $dentist_id;
              $n->save();
            }
          }
        }
      }
      // commit
      \ORM::get_db('coa')->commit();
      // response data
      $resp_data = json_encode(array());
    }catch (Exception $e) {
      $status = 500;
      var_dump($e->getTrace());
      $resp_data = json_encode(['ups', $e->getMessage()]);
    }
    $this->output
      ->set_status_header($status)
      ->set_output($resp_data);
  }
}

?>
