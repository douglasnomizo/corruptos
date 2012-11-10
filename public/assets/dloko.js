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
    $("#candidato_eleitor_nome").val(data.nome);
    $("#candidato_eleitor_nome_mae").val(data.nome_mae);
    $("#candidato_eleitor_rg").val(data.rg);
    $("#candidato_eleitor_data_nascimento").val(data.data_nascimento);
    $("#candidato_eleitor_endereco").val(data.endereco);
  }
}