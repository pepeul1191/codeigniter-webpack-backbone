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

---

Fuentes:

+ https://github.com/pepeul1191/codeigniter-boilerplate
+ https://openstreetmap.be/en/projects/howto/openlayers.html
+ https://openlayers.org/en/latest/doc/quickstart.html
+ https://openlayers.org/en/latest/doc/tutorials/bundle.html