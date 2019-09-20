<div class="login-page">
  <div class="form">
    <i class="fa fa-user" aria-hidden="true" id="logo-brand"></i>
    <form class="login-form" action="<?php echo $this->config->item('base_url') ?>admin/login" method="post">
      <input type="text" required placeholder="usuario" name="user"/>
      <input type="password" required placeholder="contrasenia" name="password"/>
      <input type="hidden" name="<?php echo $this->config->item('csrf')['key']; ?>" value="<?php echo $this->config->item('csrf')['value']; ?>">
      <button type="submit">Acceder</button>
      <p class="mensaje-error"><?php echo $message; ?></p>
      <p class="message">No está registrado? <a href="#" onclick="crearCuenta()">Crear cuenta</a></p>
    </form>
  </div>
</div>
<footer>
  <p>Powered by: <a href="http://softweb.pe/">Software Web Perú</a> © 2011-2018 </p>
</footer>

<script type="text/javascript">
  function crearCuenta() {
    alert("Operación no disponible");
    return false;
  }
</script>
