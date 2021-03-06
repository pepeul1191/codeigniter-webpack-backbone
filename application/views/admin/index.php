<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $title;?></title>
    <?php echo load_csss($this->config, $csss);?>
    <link rel="shortcut icon" href="<?php echo $this->config->item('static_url'); ?>favicon-admin.ico">
    <base href="/<?php echo $this->config->item('admin_path');?>/" />
    <script>
      var BASE_URL = '<?php echo $this->config->item('base_url');?>';
      var SPA_PATH = '<?php echo $this->config->item('admin_path');?>';
      var STATIC_URL  = '<?php echo $this->config->item('static_url');?>';
      var CSRF = "<?php echo $this->config->item('csrf')['value']; ?>";
      var CSRF_KEY = '<?php echo $this->config->item('csrf')['key']; ?>';
    </script>
  </head>
  <body>   
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary d-none" data-toggle="modal" data-target="#modal" id="btnModal">
      Launch demo modal
    </button>
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
    <!-- Header -->
    <header class="bg-primary fixed-top" id="nav1">
      <ul class="">
        <li class="">
          <a class="" href="/<?php echo $this->config->item('admin_path');?>/">Home</a>
        </li>
        <li class="">
          <a class="" href="/help">Ayuda</a>
        </li>
      </ul>
      <ul class="pull-right" style="float: right !important;">
        <li class="">
          <a class="" href="/session">Pepe Valdivia</a>
        </li>
        <li class="">
          <a class="" href="/logout">Salir</a>
        </li>
      </ul>
    </header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top" id="nav2">
      <a class="navbar-brand" href="/<?php echo $this->config->item('admin_path');?>/">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
        Administración de Contenidos
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <!--
            <li class="nav-item active">
            <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
          </li>
          -->
          <li class="nav-item">
            <a class="nav-link" href="/<?php echo $this->config->item('admin_path');?>/specialisms">Especialidades</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/<?php echo $this->config->item('admin_path');?>/technologies">Tecnología</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/<?php echo $this->config->item('admin_path');?>/dentists">Odontólogos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/<?php echo $this->config->item('admin_path');?>/branches">Sedes</a>
          </li>
          <!--
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Tablas
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="/table/location">Ubicaciones del Perú</a>
              <a class="dropdown-item" href="/table/carrers">Carreras</a>
              <a class="dropdown-item" href="/table/images">Imágenes</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="/table/teachers">Gestión de Profes</a>
            </div>
          </li>
          -->
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>
    <div id="workspace"></div>
    <footer>Sitio Desarrollado por <a href="http://softweb.pe/">Software Web Perú 2019</a></footer>
    <?php echo load_jss($this->config, $jss);?>
    <script src="https://cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
  </body>
</html>
