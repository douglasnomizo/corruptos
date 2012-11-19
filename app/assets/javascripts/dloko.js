function busca_eleitor_cpf() {
	var input_cpf = $("#candidato_cpf").val();
	$.get("/candidatos/carrega_dados/" + input_cpf, function(data) {
		preenche_campos_eleitor(data);
  });
}

function preenche_campos_eleitor(data) {
  if(data.erro == "true") {
    alert('Eleitor não encontrado!');
  } else {
    $("#candidato_eleitor_id").val(data.id);
    $("#candidato_eleitor_attributes_nome").val(data.nome);
    $("#candidato_eleitor_attributes_nome_mae").val(data.nome_mae);
    $("#candidato_eleitor_attributes_rg").val(data.rg);
    $("#candidato_eleitor_attributes_data_nascimento").val(data.data_nascimento);
    $("#candidato_eleitor_attributes_endereco").val(data.endereco);
  }
}

function busca_cep() {
  var input_cep = $(".input_cep").val();
  $.get("/enderecos/busca_cep/" + input_cep, function(data) {
    preenche_campos_endereco(data);
  });
}

function preenche_campos_endereco(data) {
  if(data.erro == "true") {
    alert('Cep não encontrado!');
  } else {
    $(".input_tipo_logradouro").val(data.tipo_logradouro);
    $(".input_logradouro").val(data.logradouro);
    $(".input_bairro").val(data.bairro);
    $(".uf_select").val(data.uf).change();
    $(".municipio_select").val(data.cidade);
  }
}

function busca_municipios() {
  var uf_id = $(".uf_select").val();
  $.ajax({
   type: "GET",
   url: "/ufs/busca_municipios/" + uf_id,
   async : false,
    success: function(data){
      var items="";
      $.each(data, function() {
        items+="<option value='"+this.id+"'>"+this.nome+"</option>";
       });
      $(".municipio_select").html(items);
    }
  });
}

function busca_secoes() {
  var input_zona = $(".zona_select").val();
  $.ajax({
   type: "GET",
   url: "/zonas/busca_secoes/" + input_zona,
   async : false,
    success: function(data){
      var items="";
      $.each(data, function() {
        items+="<option value='"+this.id+"'>"+this.codigo+"</option>";
       });
      $(".secao_select").html(items);
    }
  });
}

function busca_partidos_disponiveis() {
  /*var input_municipio = $(".").val();
  $.ajax({
   type: "GET",
   url: "/partidos/busca_partidos_disponiveis/" + input_zona,
   async : false,
    success: function(data){
     
    }
  });*/ 
}

function seleciona_cargo() {
  cargo = $("#coligacao_cargo_eleicao_cargo_id option:selected").text();
  switch (cargo) {
  case "Presidente":
    $(".uf_select").prop('disabled', true).parent("div").parent("div").hide();
    $(".municipio_select").prop('disabled', true).parent("div").parent("div").hide();
    break;
  case "Governador":
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', true).parent("div").parent("div").hide();
    break;
  case "Deputado Federal":
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', true).parent("div").parent("div").hide();
    break;
  case "Deputado Estadual":
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', true).parent("div").parent("div").hide();
    break;
  case "Senador":
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', true).parent("div").parent("div").hide();
    break;
  case "Vereador":
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', false).parent("div").parent("div").show();
    break;
  case "Prefeito":
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', false).parent("div").parent("div").show();
    break;
  default:
    $(".uf_select").prop('disabled', false).parent("div").parent("div").show();
    $(".municipio_select").prop('disabled', false).parent("div").parent("div").show();
    break;
  }
}

$(document).ready(function () {
  seleciona_cargo();
});