function busca_eleitor_cpf() {
	var input_cpf = $("#eleitor_cpf").val();
	$.get("/candidatos/carrega_dados/" + input_cpf, function(data) {
		preenche_campos_eleitor(data);
  });
}

function preenche_campos_eleitor(data) {
  if(data.erro == "true") {
    alert('Eleitor não encontrado!');
  } else {
    $("#candidato_eleitor_id").val(data.id);
    $("#candidato_eleitor_nome").val(data.nome);
    $("#candidato_eleitor_nome_mae").val(data.nome_mae);
    $("#candidato_eleitor_rg").val(data.rg);
    $("#candidato_eleitor_data_nascimento").val(data.data_nascimento);
    $("#candidato_eleitor_endereco").val(data.endereco);
  }
}

function busca_endereco_cep() {
  var input_cep = $("#eleitor_endereco_attributes_cep").val();
  $.get("/enderecos/busca_cep/" + input_cep, function(data) {
    preenche_campos_endereco(data);
  });
}

function preenche_campos_endereco(data) {
  if(data.erro == "true") {
    alert('Cep não encontrado!');
  } else {
    $("#eleitor_endereco_attributes_tipo_logradouro").val(data.tipo_logradouro);
    $("#eleitor_endereco_attributes_logradouro").val(data.logradouro);
    $("#eleitor_endereco_attributes_numero").val(data.numero);
    $("#eleitor_endereco_attributes_bairro").val(data.bairro);
    $("#uf_id").val(data.uf).change();
    $("#eleitor_endereco_attributes_municipio_id").val(data.cidade);
  }
}

function busca_municipios() {
  var uf_id = $("#uf_id").val();
  $.ajax({
   type: "GET",
   url: "/ufs/busca_municipios/" + uf_id,
   async : false,
    success: function(data){
      var items="";
      $.each(data, function() {
        items+="<option value='"+this.id+"'>"+this.nome+"</option>";
       });
      $("#eleitor_endereco_attributes_municipio_id").html(items);
    }
  });
}