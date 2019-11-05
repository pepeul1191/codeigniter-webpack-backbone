import MenuService from '../services/site/menu_service';

const menuMaker = function(){
  var resp = MenuService.get();
  // branches (sedes)
  var branches = resp.message.branches;
  var limaBracnches = '<h3>Sedes de Lima</h3>';
  var provinciaBranches = '<h3>Sedes de Provincia</h3>';
  for(var i = 0; i < branches.length; i++){
    var temp = '';
    if(branches[i].branch_type_id == '1'){
      temp = '<span class="submenu-item"><a href="' 
        + SPA_PATH + '/sedes/lima/' + branches[i].name.toLowerCase() + '">' 
        + branches[i].name + '</a></span>';
      limaBracnches = limaBracnches + temp;
    }
    if(branches[i].branch_type_id == '2'){
      temp = '<span class="submenu-item"><a href="' 
        + SPA_PATH + '/sedes/provincia/' + branches[i].name.toLowerCase() + '">' 
        + branches[i].name + '</a></span>';
      provinciaBranches = provinciaBranches + temp;
    }
  }
  $('#sedesLima').html(limaBracnches);
  $('#sedesProvincia').html(provinciaBranches);
  // technologies (tecnologia)
  var technologies = resp.message.technologies;
  for(var i = 0; i < technologies.length; i++){
    console.log(technologies[i]);
  }
}

export default menuMaker;