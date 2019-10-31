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
            <a href="#">Blog</a>
          </li>
          <li>
            <a href="#">Sedes</a>
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
            <i class="fa fa-address-book" aria-hidden="true"></i>
            <br>
            menu link 1
          </a>
        </div>
        <div class="col m2 menu">
          <a href="#">
            <i class="fa fa-area-chart" aria-hidden="true"></i>
            <br>
            menu link 2
          </a>
        </div>
        <div class="col m2 menu">
          <a href="#">
            <i class="fa fa-assistive-listening-systems" aria-hidden="true"></i>
            <br>.
            menu link 3
          </a>
        </div>
        <div class="col m2 menu">
          <a href="#">
            <i class="fa fa-balance-scale" aria-hidden="true"></i>
            <br>
            menu link 4
          </a>
        </div>
      </div>
    </menu>
    <!-- JSs -->
    <?php echo load_jss($this->config, $jss);?>
  </body>
</html>
