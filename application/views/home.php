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
        <img id="imgPreloader">
      </div>
    </div>
    <!-- modals -->
    <div id="modal1" class="modal">
      <video loop autoplay muted controls id="homeVideoModal">
        <source src=<?php echo $this->config->item('static_url');?>assets/site/videos/coa.webm type=video/webm> 
        <source src=<?php echo $this->config->item('static_url');?>assets/site/videos/coa.ogv type=video/ogg> 
        <source src=<?php echo $this->config->item('static_url');?>assets/site/videos/coa.mp4 type=video/mp4>
        <source src=<?php echo $this->config->item('static_url');?>assets/site/videos/coa.3gp type=video/3gp>
      </video>
    </div>
    <div id="modalCoronavirus" class="modal">
    <div class="x-close">
      <i class="fa fa-times" aria-hidden="true"></i>
    </div>
      <div class="carousel">
        <a class="carousel-item" href="#one!"><img src="<?php echo $this->config->item('static_url');?>assets/site/img/carta-1.jpeg"></a>
        <a class="carousel-item" href="#two!"><img src="<?php echo $this->config->item('static_url');?>assets/site/img/carta-2.jpeg"></a>
        <a class="carousel-item" href="#three!"><img src="<?php echo $this->config->item('static_url');?>assets/site/img/carta-3.jpeg"></a>
        <a class="carousel-item" href="#four!"><img src="<?php echo $this->config->item('static_url');?>assets/site/img/carta-4.jpeg"></a>
        <a class="carousel-item" href="#five!"><img src="<?php echo $this->config->item('static_url');?>assets/site/img/carta-5.jpeg"></a>
      </div>
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
          <!--
          <li>
            <a href="<?php echo $this->config->item('site_path');?>/">Home</a>
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
          </li>
          -->
          <li>
            <a class="link-nav">Tecnología</a>
            <div class="menu-sub row">
              <div class="col s12 menu-sede" id="menuTecnologia">
              </div>
            </div>
          </li>
          <li>
            <a href="<?php echo $this->config->item('site_path');?>/odontologos">Odontólogos</a>
          </li>
          <li>
            <a class="link-nav">Red</a>
            <div class="menu-sub row">
              <div class="col s6 menu-sede" id="sedesLima">
              </div>
              <div class="col s6 menu-sede" id="sedesProvincia">
              </div>
            </div>
          </li>
          <li>
            <a href="<?php /*echo $this->config->item('site_path');*/?>/agenda-tu-cita">Agenda tu cita</a>
          </li>
          <li>
            <a href="http://161.132.118.85:2027/">Facturación Electrónica</a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- end navbar -->
    <!-- sidebar -->
    <ul class="sidenav" id="mobile-nav">
      <li>
        <a class="sidenav-link" link="<?php echo $this->config->item('site_path');?>/">Home</a>
      </li>
      <li>
        <a class="sidenav-link" link="tecnologia">Tecnología</a>
      </li>
      <li>
        <a class="sidenav-link" href="<?php echo $this->config->item('site_path');?>/odontologos">Odontólogos</a>
      </li>
      <li>
        <a class="sidenav-link" link="red">Red</a>
      </li>
      <li>
        <a class="sidenav-link" link="contacto">Agendar Cita</a>
      </li>
      <li>
        <a class="sidenav-link" href="http://161.132.118.85:2027/">Facturación Electrónica</a>
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
        <div class="col m2 s3 offset-m2 menu" menu="bioseguridad">
          <img src="<?php echo $this->config->item('static_url');?>assets/site/img/menu-icon-bioserguridad.png">
          <br>
          Bioseguridad
        </div>
        <div class="col m2 s3 menu" menu="protocolo">
          <img src="<?php echo $this->config->item('static_url');?>assets/site/img/menu-icon-protocolo.png">
          <br>
          Protocolo
        </div>
        <div class="col m2 s3 menu" menu="especialidades">
          <img src="<?php echo $this->config->item('static_url');?>assets/site/img/menu-icon-especialidades.png">
          <br>
          Especialidades
        </div>
        <div class="col m2 s3 menu" menu="aseguradoras">
          <img src="<?php echo $this->config->item('static_url');?>assets/site/img/menu-icon-aseguradoras.png">
          <br>
          Aseguradoras
        </div>
      </div>
    </menu>
    <!-- footer -->
    <footer class="page-footer gray">
    </footer>
    <!-- JSs -->
    <script>
      // select img preloader according window width
      var imgPreloader = document.getElementById('imgPreloader');
      var w = window.innerWidth;
      if(w <= 576){
        imgPreloader.src = STATIC_URL + 'assets/site/img/logo-preloader-s.png';
      }else{
        imgPreloader.src = STATIC_URL + 'assets/site/img/logo-preloader.png';
      }
    </script>
    <?php echo load_jss($this->config, $jss);?>
    <script>
      // select img preloader according window width
      var imgPreloader = document.getElementById('imgPreloader');
      var w = window.innerWidth;
      if(w <= 576){
        imgPreloader.src = STATIC_URL + 'assets/site/img/logo-preloader-s.png';
      }else{
        imgPreloader.src = STATIC_URL + 'assets/site/img/logo-preloader.png';
      }
    </script>
  </body>
</html>
