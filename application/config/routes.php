<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
# site api
$route['especialidad/listar']['GET'] = 'site/siteSpecialism/list';
$route['sede/listar']['GET'] = 'site/siteBranch/list';
$route['sede/buscar']['GET'] = 'site/siteBranch/search';
$route['tecnologia/buscar']['GET'] = 'site/siteTechnology/search';
$route['odontologo/buscar']['GET'] = 'site/siteDentist/search';
$route['mail']['POST'] = 'site/siteMail/send';
$route['menu']['GET'] = 'site/siteMenu/get';
# default routes
$route['404_override'] = 'customError/orverride';
$route['translate_uri_dashes'] = FALSE;
# errores
$route['error/access/(:num)']['GET'] = 'customError/access/$1';
# login
$route['admin/login']['GET'] = 'admin/adminLogin/index';
$route['admin/login']['POST'] = 'admin/adminLogin/access';
$route['logout']['GET'] = 'admin/adminLogin/exit';
$route['session']['GET'] = 'admin/adminLogin/view';
# admin views
$route['admin']['GET'] = 'admin/adminIndex/index';
$route['admin/specialisms']['GET'] = 'admin/adminIndex/index';
$route['admin/technologies']['GET'] = 'admin/adminIndex/index';
$route['admin/technologies/edit/(:num)']['GET'] = 'admin/adminIndex/index';
$route['admin/technologies/new']['GET'] = 'admin/adminIndex/index';
$route['admin/branches']['GET'] = 'admin/adminIndex/index';
$route['admin/branches/new/lima']['GET'] = 'admin/adminIndex/index';
$route['admin/branches/new/province']['GET'] = 'admin/adminIndex/index';
$route['admin/dentists']['GET'] = 'admin/adminIndex/index';
$route['admin/dentist/new']['GET'] = 'admin/adminIndex/index';
$route['admin/dentist/edit/(:num)']['GET'] = 'admin/adminIndex/index';
$route['admin/branch/edit/(:num)']['GET'] = 'admin/adminIndex/index';
$route['admin/branch/(:num)/dentists']['GET'] = 'admin/adminIndex/index';
# admin rest
  # specialism
$route['admin/specialism/list']['GET'] = 'admin/AdminSpecialism/list';
$route['admin/specialism/save']['POST'] = 'admin/AdminSpecialism/save';
  # branch_type
$route['admin/branch_type/list']['GET'] = 'admin/AdminBranchType/list';
  # technology
$route['admin/technology/list']['GET'] = 'admin/AdminTechnology/list';
$route['admin/technology/save']['POST'] = 'admin/AdminTechnology/save';
$route['admin/technology/delete']['POST'] = 'admin/AdminTechnology/delete';
$route['admin/technology/get']['GET'] = 'admin/AdminTechnology/get';
$route['admin/technology/image/list']['GET'] = 'admin/AdminTechnology/imageList';
$route['admin/technology/image/save']['POST'] = 'admin/AdminTechnology/imageSave';
  # dentist
$route['admin/dentist/list']['GET'] = 'admin/AdminDentist/list';
$route['admin/dentist/save']['POST'] = 'admin/AdminDentist/save';
$route['admin/dentist/delete']['POST'] = 'admin/AdminDentist/delete';
$route['admin/dentist/get']['GET'] = 'admin/AdminDentist/get';
$route['admin/dentist/specialism/list']['GET'] = 'admin/AdminDentist/specialismGet';
$route['admin/dentist/specialism/save']['POST'] = 'admin/AdminDentist/specialismSave';
$route['admin/dentist/branch/list']['GET'] = 'admin/AdminDentist/branchesGet';
$route['admin/dentist/branch/save']['POST'] = 'admin/AdminDentist/branchesSave';
$route['admin/dentist/search']['GET'] = 'admin/AdminDentist/search';
  # branch
$route['admin/branch/list']['GET'] = 'admin/AdminBranch/list';
$route['admin/branch/search']['GET'] = 'admin/AdminBranch/search';
$route['admin/branch/save']['POST'] = 'admin/AdminBranch/save';
$route['admin/branch/image/save']['POST'] = 'admin/AdminBranch/imageSave';
$route['admin/branch/delete']['POST'] = 'admin/AdminBranch/delete';
$route['admin/branch/get']['GET'] = 'admin/AdminBranch/get';
$route['admin/branch/image/list']['GET'] = 'admin/AdminBranch/imageList';
$route['admin/branch/dentist']['GET'] = 'admin/AdminBranch/dentistList';
$route['admin/branch/dentist/save']['POST'] = 'admin/AdminBranch/dentistSave';
  # upload
$route['upload/file']['POST'] = 'admin/AdminUpload/file';
# site
$route['default_controller'] = 'home';
$route['odontologos']['GET'] = 'home';
$route['contacto']['GET'] = 'home';
$route['tecnologia']['GET'] = 'home';
$route['tecnologias/(:any)']['GET'] = 'home';
$route['sedes/(:any)/(:any)']['GET'] = 'home';
# demo
$route['demo']['GET'] = 'services/SiteIndex/index';
$route['demo/mail']['GET'] = 'site/siteMail/demo';