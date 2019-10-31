<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $title;?></title>
    <link rel="shortcut icon" href="<?php echo $this->config->item('static_url'); ?>favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="/" />
    <script>
      const BASE_URL = '<?php echo $this->config->item('base_url');?>';
      const STATIC_URL  = '<?php echo $this->config->item('static_url');?>';
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
        <img src="/public/assets/site/img/logo-preloader.png" alt="Centro Ondontológico Americano - Preloader">
      </div>
    </div>
    <!-- modal - video -->
    <div id="modal1" class="modal">
      <video loop autoplay muted controls id="homeVideoModal">
        <source src=http://techslides.com/demos/sample-videos/small.webm type=video/webm> 
        <source src=http://techslides.com/demos/sample-videos/small.ogv type=video/ogg> 
        <source src=http://techslides.com/demos/sample-videos/small.mp4 type=video/mp4>
        <source src=http://techslides.com/demos/sample-videos/small.3gp type=video/3gp>
      </video>
    </div>
    <!-- navbar -->
    <nav>
      <div class="">
        <a href="/" class="brand-logo">
          <img src="/public/assets/site/img/logo-coa-blanco.png" alt="Centro Ondontológico Americano">
        </a>
        <a href="#" class="sidenav-trigger" data-target="mobile-nav">
          <i class="material-icons">menu</i>
        </a>
        <ul class="right hide-on-med-and-down">
          <li>
            <a href="#">Home</a>
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
          <li>
            <a href="/tecnologia">Tecnología</a>
          </li>
          <li>
            <a href="/odontologos">Odontólogos</a>
          </li>
          <li>
            <a href="/sedes">Sedes</a>
          </li>
          <li>
            <a href="/contacto">Contacto</a>
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
        <div class="col m2 offset-m2 menu">
          <a href="#">
            <i class="fa fa-list" aria-hidden="true"></i>
            <br>
            Especialidades
          </a>
        </div>
        <div class="col m2 menu">
          <a href="#">
            <i class="fa fa-area-chart" aria-hidden="true"></i>
            <br>
            Calidad
          </a>
        </div>
        <div class="col m2 menu">
          <a href="#">
            <i class="fa fa-globe" aria-hidden="true"></i>
            <br>.
            Convenios
          </a>
        </div>
        <div class="col m2 menu">
          <a href="#">
            <i class="fa fa-address-book" aria-hidden="true"></i>
            <br>
            Pacientes
          </a>
        </div>
      </div>
    </menu>
    <!-- footer -->
    <footer class="page-footer  gray">
      <div class="row" id="contacto">
        <div class="col s6">
          <img src="/public/assets/site/img/logo-gris.png" alt="Centro Odontológico Americano">
          <h4 class="gray-text">Dudas o consultas adicionales?</h4>
          <p class="gray-text">Para contactarnos complete todos los campos del siguiente fomulario, le responderemos en la brevedad posible.</p>
          <div class="social">
            <a href="/#/facebook" style="padding: 3px;">
              <i class="fa fa-facebook-official" aria-hidden="true"></i>
            </a>
            <a href="/#/youtube" style="padding: 2px;">
              <i class="fa fa-youtube-play" aria-hidden="true"></i>
            </a>
            <a href="/#/instagram" style="padding: 3px; padding-top: 1px;">
              <i class="fa fa-instagram" aria-hidden="true"></i>
            </a>
          </div>
        </div>
        <div class="col s12 l6" style="">
          <div class="col s12 l12" style="">
            <h4 class="bold gray-text" style="margin-top: 0px;">Contacto</h4>
            <br>
            <div class="row row-form">
              <div class="input-field col s6">
                <input id="nombre" type="text" class="validate">
                <label for="nombre">Nombre</label>
              </div>
              <div class="input-field col s6">
                <input id="apellido" type="text" class="validate">
                <label for="apellido">Apellido</label>
              </div>
            </div>
            <div class="row row-form">
              <div class="input-field col s6">
                <input id="email" type="text" class="validate">
                <label for="email">Email</label>
              </div>
              <div class="input-field col s6">
                <input id="dni" type="text" class="validate">
                <label for="dni">DNI</label>
              </div>
            </div>
            <div class="row row-form">
              <div class="input-field col s12">
                <textarea id="textarea1" class="materialize-textarea" rows="4"></textarea>
                <label for="textarea1">Consulta</label>
              </div>
            </div>
            <div class="row row-form">
              <div class="col s12">
                <p>
                  <label>
                    <input type="checkbox" />
                    <span class="gray-text">
                      He leído y estoy informado sobre la Ley N° 29733 - Ley de Protección de Datos Personales y su reglamento aprobado mediante Decreto Supremo N° 003-2013-JUS.
                    </span>
                  </label>
                </p>
                <p class="gray-text">
                  Condiciones
                </p>
              </div>
            </div>
            <div class="row row-form">
              <div class="col s6">
                <label>
                  <input name="group1" type="radio" />
                  <span class="gray-text">Acepto</span>
                </label>
              </div>
              <div class="col s6" style="margin-bottom: 40px;">
                <label>
                  <input name="group1" type="radio" />
                  <span class="gray-text">No Acepto</span>
                </label>
              </div>
            </div>
            <div class="row row-form">
              <a class="waves-effect waves-light btn">button</a>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-copyright secondary">
        <div class="row">
          <div class="col l6 s12">
            <span class="white-text text-lighten-4 bold">D</span> Sede Central: Av Juan de Arona 425 San isidro <span class="white-text text-lighten-4 bold">T</span> 421 6323<br>
            central@coa.pe<br>
            <span class="white-text text-lighten-4 bold" id="terminos-condiciones">Términos y Condiciones<span>
          </div>
          <div class="col l6 s12">
            © 2018 Centro Ondontológico Americano - Derechos Reservados<br>
            <a class="white-text text-lighten-4 bold" href="http://softweb.pe/website/">Sitio Desarollado por Software Web Perú ©</a>
          </div>
        </div>
      </div>
    </footer>
    <!-- JSs -->
    <?php echo load_jss($this->config, $jss);?>
  </body>
</html>
