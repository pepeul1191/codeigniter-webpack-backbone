<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $title;?></title>
    <link rel="shortcut icon" href="<?php echo $this->config->item('static_url'); ?>favicon.ico">
    <base href="/" />
    <script>
      var BASE_URL = '<?php echo $this->config->item('base_url');?>';
      var STATIC_URL  = '<?php echo $this->config->item('static_url');?>';
      var CSRF = "<?php echo $this->config->item('csrf')['value']; ?>";
      var CSRF_KEY = '<?php echo $this->config->item('csrf')['key']; ?>';
    </script>
    <?php echo load_csss($this->config, $csss);?>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  </head>
  <body>   
    <div class="preloader">
      <!-- svg -->
      <div class="wrapper">
        <svg
          xmlns:dc="http://purl.org/dc/elements/1.1/"
          xmlns:cc="http://creativecommons.org/ns#"
          xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
          xmlns:svg="http://www.w3.org/2000/svg"
          xmlns="http://www.w3.org/2000/svg"
          xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
          xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
          width="64mm"
          height="64mm"
          viewBox="0 0 226.77165 226.77165"
          id="svg2"
          version="1.1"
          inkscape:version="0.91 r13725"
          sodipodi:docname="tooth.svg">
          <defs
            id="defs4" />
          <sodipodi:namedview
            id="base"
            pagecolor="#ffffff"
            bordercolor="#666666"
            borderopacity="1.0"
            inkscape:pageopacity="0.0"
            inkscape:pageshadow="2"
            inkscape:zoom="0.98994949"
            inkscape:cx="8.7316945"
            inkscape:cy="242.53835"
            inkscape:document-units="px"
            inkscape:current-layer="layer1"
            showgrid="false"
            inkscape:window-width="1280"
            inkscape:window-height="848"
            inkscape:window-x="0"
            inkscape:window-y="24"
            inkscape:window-maximized="1" />
          <metadata
            id="metadata7">
            <rdf:RDF>
              <cc:Work
                rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type
                  rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
                <dc:title></dc:title>
              </cc:Work>
            </rdf:RDF>
          </metadata>
          <g
            inkscape:label="Capa 1"
            inkscape:groupmode="layer"
            id="layer1"
            transform="translate(0,-825.59055)">
            <path
              style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;stroke-miterlimit:4;stroke-dasharray:none"
              d="m 64.051877,890.89401 c 14.749719,-4.22199 30.872483,13.01819 46.214563,13.01819 22.70628,0 25.56215,-12.59477 46.54002,-3.90546 39.68988,16.44009 39.68988,112.43996 0,128.88006 -21.54484,8.9241 -28.62684,-7.3707 -51.74729,-10.4146 -20.281349,-2.6701 -34.430667,3.8055 -50.868986,-8.37 C 28.213233,990.86154 32.973492,899.78996 64.051877,890.89401 Z"
              id="path3336"
              inkscape:connector-curvature="0"
              sodipodi:nodetypes="sssssss" />
            <text
              xml:space="preserve"
              style="font-style:normal;font-weight:normal;font-size:40px;line-height:125%;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;"
              x="48.48732"
              y="872.55505"
              id="text3388"
              sodipodi:linespacing="125%"><tspan
                sodipodi:role="line"
                id="tspan3390"
                x="48.48732"
                y="872.55505">Diente</tspan></text>
          </g>
        </svg>
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
