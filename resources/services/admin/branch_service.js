var TechnologyService = {
  saveDetail: function(model, messageLabelId){
    var resp = {};
    $.ajax({
      type: 'POST',
      url: BASE_URL + 'admin/branch/save',
      data: {
        id: model.get('id'),
        name: model.get('name'),
        image: model.get('image'),
        address: model.get('address'),
        branch_type_id: model.get('branch_type_id'),
        director_id: model.get('director_id'),
        emergency: model.get('emergency'),
        latitude: model.get('latitude'),
        longitude: model.get('longitude'),
        phone: model.get('phone'),
        url: model.get('url'),
        whatsapp: model.get('whatsapp'),
      },
      headers: {
        [CSRF_KEY]: CSRF,
      },
      async: false,
      success: function(data){
        // show message
        $('#' + messageLabelId).removeClass('alert-danger');
        $('#' + messageLabelId).removeClass('alert-warning');
        $('#' + messageLabelId).addClass('alert-success');
        $('#' + messageLabelId).html('Detalle de tecnología guardado con éxito');
        // $('html, body').animate({ scrollTop: $("#" + messageLabelId).offset().top }, 1000);
        // return data
        resp.message = data;
        resp.status = 200;
      },
      error: function(xhr, status, error){
        // show message
        if(xhr.status == 404){
          $('#' + messageLabelId).removeClass('alert-success');
          $('#' + messageLabelId).removeClass('alert-warning');
          $('#' + messageLabelId).addClass('alert-danger');
          $('#' + messageLabelId).html('Recurso no encontrado');
          // $('html, body').animate({ scrollTop: $("#" + messageLabelId).offset().top }, 1000);
        }else if(xhr.status == 501){
          $('#' + messageLabelId).removeClass('alert-success');
          $('#' + messageLabelId).removeClass('alert-warning');
          $('#' + messageLabelId).addClass('alert-danger');
          $('#' + messageLabelId).html('Ocurrió un error controlado en grabar el detalle de la tecnología');
          // $('html, body').animate({ scrollTop: $("#" + messageLabelId).offset().top }, 1000);
        }else{
          $('#' + messageLabelId).removeClass('alert-success');
          $('#' + messageLabelId).removeClass('alert-warning');
          $('#' + messageLabelId).addClass('alert-danger');
          $('#' + messageLabelId).html('Ocurrió un error no controlado en grabar el detalle de la tecnología');
          // $('html, body').animate({ scrollTop: $("#" + messageLabelId).offset().top }, 1000);
        }
        console.error(error);
        // return data
				resp.message = JSON.parse(xhr.responseText);
				resp.status = 500;
      }
    });
    return resp;
  },
  getDetail: function(id){
    var resp = {};
    $.ajax({
      type: 'GET',
      url: BASE_URL + 'admin/branch/get',
      data: {
        id: id,
      },
      headers: {
        [CSRF_KEY]: CSRF,
      },
      async: false,
      success: function(data){
        resp.message = JSON.parse(data);
        resp.status = 200;
      },
      error: function(xhr, status, error){
        console.error(error);
				resp.message = JSON.parse(xhr.responseText);
        resp.status = xhr.status;
      }
    });
    return resp;
  },
};

export default TechnologyService;