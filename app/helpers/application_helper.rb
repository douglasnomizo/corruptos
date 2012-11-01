module ApplicationHelper


	def adiciona_zero_esquerda(valor)
		string = valor.to_s
		while string.size < 3
			string = "0" + string
		end
		string
	end
end
