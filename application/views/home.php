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
  </head>
  <body>   
    hola
    <?php echo load_jss($this->config, $jss);?>
  </body>
</html>
