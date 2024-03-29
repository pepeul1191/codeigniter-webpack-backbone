<!DOCTYPE html>
<html>
<head>
    <title><?php echo $title;?></title>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="<?php echo $this->config->item('static_url'); ?>favicon-admin.ico">
    <?php echo load_csss($this->config, $csss);?>
</head>
<body>
  <input type="hidden" name="ci_csrf_token" value="version:3" onmouseover=prompt(965267) bad=\"" />

  <form class="form-signin" action="/admin/login" method="post">
    <h1 class="h3 mb-3 font-weight-normal">Bienvenido</h1>
    <input type="hidden" name="key" value="value">
    <span class="extraData"></span>
    <!--USER -->
    <label for="user" class="sr-only">User</label>
    <input type="text" id="user" class="form-control" placeholder="Usuario" required="" autofocus="" name="user">
    <!--CSRF -->
    <input type="hidden" name="<?php echo $this->config->item('csrf')['key']; ?>" value="<?php echo $this->config->item('csrf')['value']; ?>">
    <!--PASS -->
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required="" name="password">
    <!--MESSAGE-->
    <p class="<?php echo $message_color; ?> message" style="margin-top:10px;" id="login-message"><?php echo $message; ?></p>
    <!--BUTTON -->
    <button class="btn btn-lg btn-primary btn-block" type="submit">
      Ingresar
    </button>
    <!--FooTER LOGIN NAV -->
    <div class="link-login">
      <a class="" href="/login/sign_in">
        Registrarse
      </a>
      <a id="forgotpassword" class="pull-right" href="/login/reset_password">
        Olvidó su Contraseña
      </a>
    </div>
    <p class="mt-5 mb-3 text-muted">Powered By <a href="http://softweb.pe/"> Softtware Web Perú</a> © 2017-2018</p>
  </form>
  <?php echo load_jss($this->config, $jss);?>
</body>
</html>
