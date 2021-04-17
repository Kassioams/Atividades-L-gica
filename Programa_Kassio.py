quantidade = int(raw_input())

proposicoes = []
for i in range(quantidade):
	proposicoes.append(raw_input())
	
resultado = []
for expressao in proposicoes:
	valida = False
	disjuncoes = expressao.split("&")
	for disjuncao in disjuncoes:
		literais = ""
		for char in disjuncao:
			if char not in "|()":
				literais += char
		literais = literais.split(" ")			
		for literal in literais:
			if "!" in literal:
				if (literais.__contains__(literal[1])):
					valida = True
					break
			else:
				if (literais.__contains__("!" + literal)):
					valida = True	
					break		
	resultado.append(valida)
	
for i in resultado:
	if i == False:
		print "nao eh valido"
	else:
		print "eh valido"

