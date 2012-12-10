function busca_eleitor_cpf() {
	var input_cpf = $("#candidato_cpf").val();
	$.get("/candidatos/carrega_dados/" + input_cpf, function(data) {
		preenche_campos_eleitor(data);
  });
}

function preenche_campos_eleitor(data) {
  if(data.erro == "true") {
    alert('Eleitor não encontrado!');
  } else if(data.erro == "cadastrado") {
    alert('Eleitor já é candidato da eleição!');
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
  case "Vice-Prefeito":
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

$("#rel_uf_id").change(function() {
  var uf_id = $("#rel_uf_id").val();
  $.ajax({
   type: "GET",
   url: "/ufs/busca_municipios/" + uf_id,
   async : false,
    success: function(data){
      var items="";
      $.each(data, function() {
        items+="<option value='"+this.id+"'>"+this.nome+"</option>";
       });
      $("#rel_municipio_id").html(items);
      $(".sl_municipio").show();
    }
  });
});

$("#rel_municipio_id").change(function() {
  var municipio_id = $("#rel_municipio_id").val();
  $.ajax({
   type: "GET",
   url: "/municipios/busca_zonas/" + municipio_id,
   async : false,
    success: function(data){
      var items="<option></option>";
      $.each(data, function() {
        items+="<option value='"+this.id+"'>"+this.descricao+"</option>";
       });
      $("#rel_zona_id").html(items);
      $(".sl_zona").show();
    }
  });
});

$("#rel_zona_id").change(function() {
  var input_zona = $("#rel_zona_id").val();
  if (input_zona == '') {
    $("#rel_secao_id").html("");
    $(".sl_secao").hide();
  } else {
    $.ajax({
     type: "GET",
     url: "/zonas/busca_secoes/" + input_zona,
     async : false,
      success: function(data){
        var items="<option></option>";
        $.each(data, function() {
          items+="<option value='"+this.id+"'>"+this.codigo+"</option>";
         });
        $("#rel_secao_id").html(items);
        $(".sl_secao").show();
      }
    });
  }
});

$("#btn_gerar_relatorio").click(function() {
  var secao_id = $("#rel_secao_id").val();
  var zona_id = $("#rel_zona_id").val();
  var municipio_id = $("#rel_municipio_id").val();
  var candidato_cpf = $("#candidato_cpf").val();
  $("#candidato_cpf").val('');

  if (candidato_cpf) {
    window.open("candidato.pdf?cpf=" + candidato_cpf,'_blank');
  } else if (secao_id != null && secao_id != '') {
    window.open("secao.pdf?id=" + secao_id,'_blank');
  } else if (zona_id != null && zona_id != '') {
    window.open("zona.pdf?id=" + zona_id,'_blank');
  } else if (municipio_id != null && municipio_id != '') {
    window.open("municipio.pdf?id=" + municipio_id,'_blank');
  } else {
    alert('Selecione um município ou informe um candidato!');
  }
  return false;
});