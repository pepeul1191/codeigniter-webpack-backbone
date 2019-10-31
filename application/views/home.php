<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $title;?></title>
    <link rel="shortcut icon" href="<?php echo $this->config->item('static_url'); ?>favicon.ico">
    <base href="/" />
    <script>
      const BASE_URL = '<?php echo $this->config->item('base_url');?>';
      const STATIC_URL  = '<?php echo $this->config->item('static_url');?>';
      const CSRF = "<?php echo $this->config->item('csrf')['value']; ?>";
      const CSRF_KEY = '<?php echo $this->config->item('csrf')['key']; ?>';
      var FIRST_LOAD = true;
    </script>
    <?php echo load_csss($this->config, $csss);?>
  </head>
  <body>   
    <div class="preloader">
      <div class="wrapper">
        <img src="/public/assets/site/img/logo-preloader.png" alt="Centro Ondontológico Americano - Preloader">
      </div>
    </div>

    <!-- Modal Structure -->
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
        <a href="#" class="brand-logo">Web Zone</a>
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
            <a href="#">Tutorial</a>
          </li>
          <li>
            <a href="#">Contact</a>
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
    <!-- video -->
    <div class="video-container">
      <video loop autoplay muted id="homeVideo">
        <source src=http://techslides.com/demos/sample-videos/small.webm type=video/webm> 
        <source src=http://techslides.com/demos/sample-videos/small.ogv type=video/ogg> 
        <source src=http://techslides.com/demos/sample-videos/small.mp4 type=video/mp4>
        <source src=http://techslides.com/demos/sample-videos/small.3gp type=video/3gp>
      </video>
      <div class="overlay">
        <p>Content above your video</p>
        <div class="valign-wrapper center-align">
          <h5 class="">This should be vertically aligned</h5>
          <button class="waves-effect waves-light btn modal-trigger" href="#modal1">button</button>
        </div>
      </div>
    </div>
    <!-- end -->
    <div class="box container green">
    </div>
    <menu id="menu" class="blue">
      <div class="row">
        <div class="col s1 m1">1</div>
        <div class="col s1 m1">2</div>
        <div class="col s1 m1">3</div>
        <div class="col s1 m1">4</div>
        <div class="col s1 m1">5</div>
        <div class="col s1 m1">6</div>
        <div class="col s1 m1">7</div>
        <div class="col s1 m1">8</div>
        <div class="col s1 m1">9</div>
        <div class="col s1 m1">10</div>
        <div class="col s1 m1">11</div>
        <div class="col s1 m1">12</div>
      </div>
    </menu>
    <?php echo load_jss($this->config, $jss);?>
  </body>
</html>
