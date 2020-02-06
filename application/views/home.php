<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $title;?></title>
    <link rel="shortcut icon" href="<?php echo $this->config->item('static_url'); ?>favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<?php echo $this->config->item('site_path');?>" />
    <script>
      const BASE_URL = '<?php echo $this->config->item('base_url');?>';
      const STATIC_URL  = '<?php echo $this->config->item('static_url');?>';
      const SPA_PATH = '<?php echo $this->config->item('site_path');?>';
      const CSRF = "<?php echo $this->config->item('csrf')['value']; ?>";
      const CSRF_KEY = '<?php echo $this->config->item('csrf')['key']; ?>';
      var FIRST_LOAD = true;
    </script>
    <!-- CSSs -->
    
    <?php echo load_csss($this->config, $csss);?>
  </head>
  <body>
    <!-- preloader -->   
    <div class="preloader">
      <div class="wrapper">
        <img src="<?php echo $this->config->item('static_url');?>assets/site/img/logo-preloader.png" alt="Centro Ondontológico Americano - Preloader">
      </div>
    </div>
    <!-- modals -->
    <div id="modal1" class="modal">
      <video loop autoplay muted controls id="homeVideoModal">
        <source src=http://techslides.com/demos/sample-videos/small.webm type=video/webm> 
        <source src=http://techslides.com/demos/sample-videos/small.ogv type=video/ogg> 
        <source src=http://techslides.com/demos/sample-videos/small.mp4 type=video/mp4>
        <source src=http://techslides.com/demos/sample-videos/small.3gp type=video/3gp>
      </video>
    </div>
    <a class="waves-effect waves-light btn modal-trigger hide" href="#modalBottom" id="modal-bottom-btn" >Modal Bottom</a>
    <div id="modalBottom" class="modal bottom-sheet"></div>
    <a class="waves-effect waves-light btn modal-trigger hide" href="#modalPopUp" id="modal-popup-btn" >Modal PopUp</a>
    <div id="modalPopUp" class="modal modal-fixed-footer"></div>
    <!-- navbar -->
    <nav>
      <div class="nav-wrapper container">
        <a href="<?php echo $this->config->item('site_path');?>/" class="brand-logo">
          <img src="<?php echo $this->config->item('static_url');?>assets/site/img/logo-coa-blanco.png" alt="Centro Ondontológico Americano">
        </a>
        <a href="#" class="sidenav-trigger" data-target="mobile-nav">
          <i class="fa fa-bars" aria-hidden="true"></i>
        </a>
        <ul class="right hide-on-med-and-down">
          <li>
            <a href="<?php echo $this->config->item('site_path');?>/">Home</a>
            <!--
            <div class="menu-sub">
              <div class="menu-col-1">
                <h3 class="">Category</h3>
                <ul>
                  <li><a href="">Link 01</a></li>
                  <li><a href="">Link 02</a></li>
                  <li><a href="">Link 03</a></li>
                  <li><a href="">Link 04</a></li>
                  <li><a href="">Link 05</a></li>
                </ul>
              </div>
              <div class="menu-col-1">
                <h3 class="">Category</h3>
                <ul>
                <li><a href="">Link 01</a></li>
                <li><a href="">Link 02</a></li>
                </ul>
              </div>
              <div class="menu-col-1">
                <h3 class="">Category</h3>
                <ul>
                  <li><a href="">Link 01</a></li>
                  <li><a href="">Link 02</a></li>
                </ul>
              </div>
            </div>
            -->
          </li>
          <li>
            <a href="<?php echo $this->config->item('site_path');?>/tecnologia">Tecnología</a>
            <div class="menu-sub row">
              <div class="col s12 menu-sede" id="menuTecnologia">
              </div>
            </div>
          </li>
          <li>
            <a href="<?php echo $this->config->item('site_path');?>/odontologos">Odontólogos</a>
          </li>
          <li>
            <a href="<?php echo $this->config->item('site_path');?>/sedes">Sedes</a>
            <div class="menu-sub row">
              <div class="col s6 menu-sede" id="sedesLima">
              </div>
              <div class="col s6 menu-sede" id="sedesProvincia">
              </div>
            </div>
          </li>
          <li>
            <a href="<?php /*echo $this->config->item('site_path');*/?>/contacto">Contacto</a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- end navbar -->
    <!-- sidebar -->
    <ul class="sidenav" id="mobile-nav">
      <li>
        <a href="#">Blog</a>
      </li>
      <li>
        <a href="#">Blog</a>
      </li>
      <li>
        <a href="#">Tutorial</a>
      </li>
      <li>
        <a href="#">Contact</a>
      </li>
    </ul>
    <!-- end sidebar -->
    <!-- slider -->
    <!--
    <div class="carousel carousel-slider ">
      <a class="carousel-item"><img src="/img/foto01.jpg"></a>
      <a class="carousel-item"><img src="/img/foto02.jpg"></a>
      <a class="carousel-item"><img src="/img/foto03.jpg"></a>
    </div>
    -->
    <!-- /slider -->
    <!-- workspace -->
    <div id="workspace"></div>
    <!-- second menu -->
    <menu id="menu" class="secondary">
      <div class="row">
        <div class="col m2 offset-m2 menu" menu="especialidades">
          <i class="fa fa-list" aria-hidden="true"></i>
          <br>
          Especialidades
        </div>
        <div class="col m2 menu" menu="calidad">
          <i class="fa fa-area-chart" aria-hidden="true"></i>
          <br>
          Calidad
        </div>
        <div class="col m2 menu" menu="convenios">
          <i class="fa fa-globe" aria-hidden="true"></i>
          <br>
          Aseguradoras
        </div>
        <div class="col m2 menu" menu="pacientes">
          <i class="fa fa-address-book" aria-hidden="true"></i>
          <br>
          Pacientes
        </div>
      </div>
    </menu>
    <!-- footer -->
    <footer class="page-footer gray">
    </footer>
    <!-- JSs -->
    <?php echo load_jss($this->config, $jss);?>
  </body>
</html>
