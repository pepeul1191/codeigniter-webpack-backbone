<?php

class SiteMail extends CI_Controller
{
  public function demo()
  {
    // request data
    // TODO
    // get layout
    $layout = require __DIR__ . '/../../views/mails/response.php';
    // data
    $logo_url = $this->config->item('static_url') . 'assets/site/img/logo-coa-celeste.png';
    $img_url = $this->config->item('static_url') . 'assets/site/img/odontologos.jpg';
    $favicon = $this->config->item('static_url') . 'favicon.ico';
    $nombre = 'Pepe Valdivia';
    // str_replace layout
    $data_layout = array(
      '%logo_url' => $logo_url,
      '%img_url' => $img_url,
      '%nombre' => $nombre,
      '%favicon' => $favicon,
    );
    $message = str_replace(array_keys($data_layout), array_values($data_layout), $layout);
    echo($message);
  }
}