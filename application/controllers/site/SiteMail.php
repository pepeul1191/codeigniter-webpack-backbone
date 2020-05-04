<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

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
    $email = $this->config->item('mail')['gmail_email'];
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
    $mail = new PHPMailer(true);                              // Passing `true` enables exceptions
    try {
      // server settings
      $mail->SMTPDebug = 2;                                 // Enable verbose debug output
      $mail->isSMTP();                                      // Set mailer to use SMTP
      $mail->Debugoutput = 'html';
      $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
      $mail->SMTPAuth = true;                               // Enable SMTP authentication
      $mail->Username = $this->config->item('mail')['gmail_email'];                 // SMTP username
      $mail->Password = $this->config->item('mail')['gmail_pass'];                           // SMTP password
      $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
      $mail->Port = 465;                                    // TCP port to connect to
      // recipients
      $mail->setFrom('from@example.com', 'Mailer');
      $mail->addAddress($this->config->item('mail')['gmail_email'], 'Pepe Valdivia');     // Add a recipient
      // content
      $mail->isHTML(true);                                  // Set email format to HTML
      $mail->Subject = 'Here is the subject';
      $mail->Body    = $message;
      // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
      // send
      $mail->send();
      echo 'Message has been sent';
    } catch (Exception $e) {
      echo 'Message could not be sent.';
      echo 'Mailer Error: ' . $mail->ErrorInfo;
    }
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
    // load .env
    $dotenv = \Dotenv\Dotenv::createImmutable(__DIR__ . '/../../..');
    $dotenv->load();
    $status = 200;
    $resp = '';
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
    $message = str_replace(
      array_keys($data_layout), 
      array_values($data_layout), 
      $layout
    );
    // do mail to visitor
    $mail = new PHPMailer(true);
    try {
      // server settings
      $mail->SMTPDebug = 0;
      $mail->isSMTP();
      $mail->CharSet = 'UTF-8';
      $mail->Debugoutput = 'html';
      $mail->Host = 'mail.coa.pe';
      $mail->SMTPAuth = true;
      $mail->Username = $_ENV['MAIL_USER'];
      $mail->Password = $_ENV['MAIL_PASS'];
      $mail->SMTPSecure = 'ssl';
      $mail->Port = 465;
      // recipients
      $mail->setFrom($_ENV['MAIL_USER'], 'Agenda tu Cita - COA');
      $mail->addAddress($email, $apellido . ' ' .$nombre);     // Add a recipient
      // content
      $mail->isHTML(true);                                  // Set email format to HTML
      $mail->Subject = 'COA - Gracias por contactarnos';
      $mail->Body = $message;
      // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
      // send
      $mail->send();
      $resp = 'Correo enviado';
    } catch (Exception $e) {
      $resp = json_encode(['ups', $e->getMessage()]);
      $status = 500;
    }
    // do mail to COA
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
    $layout = require __DIR__ . '/../../views/mails/visitor.php';
    $message = str_replace(
      array_keys($data_layout), 
      array_values($data_layout), 
      $layout
    );
    // do mail
    $mail2 = new PHPMailer(true);
    try {
      // server settings
      $mail2->SMTPDebug = 0;
      $mail2->isSMTP();
      $mail2->CharSet = 'UTF-8';
      $mail2->Debugoutput = 'html';
      $mail2->Host = 'mail.coa.pe';
      $mail2->SMTPAuth = true;
      $mail2->Username = $_ENV['MAIL_USER'];
      $mail2->Password = $_ENV['MAIL_PASS'];
      $mail2->SMTPSecure = 'ssl';
      $mail2->Port = 465;
      // recipients
      $mail2->setFrom($_ENV['MAIL_USER'], 'Agenda tu Cita - COA');
      $mail2->addAddress($_ENV['MAIL_RESPONSE'], '');     // Add a recipient
      // content
      $mail2->isHTML(true);                                  // Set email format to HTML
      $mail2->Subject = 'Agenda de Citas - Web';
      $mail2->Body = $message;
      // $mail2->AltBody = 'This is the body in plain text for non-HTML mail clients';
      // send
      $mail2->send();
      $resp = 'Correo enviado';
    } catch (Exception $e) {
      $resp = json_encode(['ups', $e->getMessage()]);
      $status = 200;
    }
    $this->output
      ->set_status_header($status)
      ->set_output($resp);
  }

  public function send2()
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
    $headers .= 'From: ' .  $this->config->item('mail')['gmail_email'];
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
    $to      = $this->config->item('mail')['gmail_email'];
    $subject = 'Ha recibido un mensaje del sitio web del COA';
    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
    $headers .= 'From: ' . $this->config->item('mail')['gmail_email'];
    if(ENV == 'localhost'){
      echo $message;
    }else if(ENV == '000webhost' || ENV == 'coa'){
      mail($to, $subject, $message, $headers); 
    }
  }
}