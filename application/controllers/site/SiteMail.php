<?php

class SiteMail extends CI_Controller
{
  public function demo()
  {
    // request data
    // TODO
    // get layout
    $layout = require __DIR__ . '/../../views/mails/response.php';
    $layout = require __DIR__ . '/../../views/mails/visitor.php';
    // data
    $nombre = 'Pepe';
    $apellido = 'Valdivia';
    $email = 'pepe.valdivia.caballero@gmail.com';
    $dni = '70241720';
    $consulta = 'hola tengo una duda!!!';
    $logo_url = $this->config->item('static_url') . 'assets/site/img/logo-coa-celeste.png';
    $img_url = $this->config->item('static_url') . 'assets/site/img/mail.jpg';
    $base_url = $this->config->item('base_url');
    $favicon = $this->config->item('static_url') . 'favicon.ico';
    // str_replace layout
    $data_layout = array(
      '%nombre' => $nombre, 
      '%apellido' => $apellido, 
      '%email' => $email, 
      '%dni' => $dni, 
      '%consulta' => $consulta, 
      '%logo_url' => $logo_url,
      '%img_url' => $img_url,
      '%base_url' => $base_url,
      '%favicon' => $favicon,
    );
    $message = str_replace(array_keys($data_layout), array_values($data_layout), $layout);
    echo($message);
  }

  public function send()
  {
    //libraries as filters
    $this->load->library('HttpAccess',
      array(
        'config' => $this->config,
        'allow' => ['POST'],
        'received' => $this->input->server('REQUEST_METHOD'),
        'instance' => $this,
      )
    );
    // mail to visitor
    $layout = require __DIR__ . '/../../views/mails/response.php';
    $nombre = $this->input->post('nombre');
    $apellido = $this->input->post('apellido');
    $email = $this->input->post('email');
    $dni = $this->input->post('dni');
    $consulta = $this->input->post('consulta');
    $logo_url = $this->config->item('static_url') . 'assets/site/img/logo-coa-celeste.png';
    $img_url = $this->config->item('static_url') . 'assets/site/img/mail.jpg';
    $favicon = $this->config->item('static_url') . 'favicon.ico';
    $data_layout = array(
      '%nombre' => $nombre, 
      '%apellido' => $apellido, 
      '%email' => $email, 
      '%dni' => $dni, 
      '%consulta' => $consulta, 
      '%logo_url' => $logo_url,
      '%img_url' => $img_url,
      '%favicon' => $favicon,
    );
    $message = str_replace(array_keys($data_layout), array_values($data_layout), $layout);
    $to      = $email;
    $subject = 'COA - Gracias por contactarnos';
    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
    $headers .= 'From: ' . 'pepe.valdivia.caballero@gmail.com';
    if(ENV == 'localhost'){
      echo $message;
    }else if(ENV == '000webhost' || ENV == 'coa'){
      mail($to, $subject, $message, $headers); 
    }
    // mail to admin
    $layout = require __DIR__ . '/../../views/mails/visitor.php';
    $nombre = $this->input->post('nombre');
    $apellido = $this->input->post('apellido');
    $email = $this->input->post('email');
    $dni = $this->input->post('dni');
    $consulta = $this->input->post('consulta');
    $logo_url = $this->config->item('static_url') . 'assets/site/img/logo-coa-celeste.png';
    $img_url = $this->config->item('static_url') . 'assets/site/img/mail.jpg';
    $favicon = $this->config->item('static_url') . 'favicon.ico';
    $data_layout = array(
      '%nombre' => $nombre, 
      '%apellido' => $apellido, 
      '%email' => $email, 
      '%dni' => $dni, 
      '%consulta' => $consulta, 
      '%logo_url' => $logo_url,
      '%img_url' => $img_url,
      '%favicon' => $favicon,
    );
    $message = str_replace(array_keys($data_layout), array_values($data_layout), $layout);
    $to      = 'pepe.valdivia.caballero@gmail.com';
    $subject = 'Ha recibido un mensaje del sitio web del COA';
    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
    $headers .= 'From: ' . 'pepe.valdivia.caballero@gmail.com';
    if(ENV == 'localhost'){
      echo $message;
    }else if(ENV == '000webhost' || ENV == 'coa'){
      mail($to, $subject, $message, $headers); 
    }
  }
}