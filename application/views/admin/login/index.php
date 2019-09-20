<div class="login-page">
  <div class="form">
    <!--
    <i class="fa fa-map-marker" aria-hidden="true" id="logo-brand"></i>
    -->    
    <form class="login-form" action="<?php echo $this->config->item('base_url') ?>login" method="post">
      <input type="text" placeholder="usuario" name="user"/>
      <input type="password" placeholder="contrasenia" name="password"/>
      <input type="hidden" name="<?php echo $this->config->item('csrf')['key']; ?>" value="<?php $this->config->item('csrf')['value']; ?>">
      <button type="submit">login</button>
      <p class="mensaje-error"><?php echo $mensaje; ?></p>
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
