$("select").change(function(){
	alert('a');
  var url = 'uf/municipios_do_estado?id=' + $(this).val()
  $("select .municipios").removeOption(/./)
  $.get(url, function(data) {
    $("select .municipios").addOption(data, false);
  });
});

function preenche_municipios() { 	
}

function preenche_cargos() {}

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
    $("#eleitor_nome").val(data.nome);
    $("#eleitor_nome_mae").val(data.nome_mae);
    $("#eleitor_rg").val(data.rg);
    $("#eleitor_data_nascimento").val(data.data_nascimento);
    $("#eleitor_endereco").val(data.endereco_id);
  }
}