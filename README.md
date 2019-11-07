# CodeIgniter

Instalación de dependencias:

    $ composer install

Servidor de desarrollo

    $ composer start

### Migraciones

Migraciones con DBMATE - accesos:

    $ dbmate -d "db/migrations" -e "DB" new <<nombre_de_migracion>>
    $ dbmate -d "db/migrations" -e "DB" up
    $ dbmate -d "db/migrations" -e "DB" new <<nombre_de_migracion>>
    $ dbmate -d "db/migrations" -e "DB" up
    $ dbmate -d "db/migrations" -e "DB" rollback

### TODOD

+ Al eliminar branches y tecnologies, debe de borrar branches_images y tecnologies_images.
+ Al eliminar branches y tecnologies, debe de borrar imagen almacenada.

### .htaccess

Desarrollo

```
# html5 pushstate (history) support:
<ifModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /admin/
    RewriteCond %{THE_REQUEST} ^.*/index.php 
    RewriteRule ^(.*)index.php$ /admin/$1 [R,L] 
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} !^/index\.php
    RewriteRule (.*) index.php
</ifModule>
```

Hosting

```
RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-l

RewriteRule ^(.+)$ index.php?url=$1 [QSA,L]
```

### EMail Templates

+ https://colorlib.com/wp/responsive-html-email-templates/
+ https://colorlib.com/etc/email-template/1/index.html

### Pasos de despligue

1. SSH - pull and rewrite

    $ git reset --hard origin/master

2. CPanel - Configurar versión de PHP a 7.1

3. SSH - con nano cambiar el ambiente en index.php

4. FTP - subir los archivos public/dist y public/templates

---

Fuentes:

+ https://github.com/pepeul1191/codeigniter-boilerplate
+ https://openstreetmap.be/en/projects/howto/openlayers.html
+ https://openlayers.org/en/latest/doc/quickstart.html
+ https://openlayers.org/en/latest/doc/tutorials/bundle.html