module UFCG

abstract sig Carona{
	passageiros: set Usuario
}

abstract sig Usuario{
	regiao: one Regiao
}

sig Aluno extends Usuario{}

sig Servidor extends Usuario{}

sig Professor extends Usuario{}

sig IdaUFCG extends Carona{
	horario: one HorarioIda
}

sig VoltaUFCG extends Carona{
	horario: one HorarioVolta
}

abstract sig Regiao{}

sig Bodocongo, JosePinheiro, Malvinas, Palmeira, Altamira extends Regiao{}

abstract sig HorarioIda{}

abstract sig HorarioVolta{}

sig SeteMeia, NoveMeia, TrezeMeia, QuinzeMeia extends HorarioIda{}

sig Dez, Doze, Quatorze, Dezesseis extends HorarioVolta{}

fact Formulas{
	all u:Usuario | one passageiros.u
	all c:Carona| (#c.passageiros) >= 1 and (#c.passageiros) <=3
	all c:Carona, p:c.passageiros | p.regiao = c.passageiros.regiao
	all i:IdaUFCG, v:VoltaUFCG| one i.horario and one v.horario
	all r: Regiao | some regiao.r
	all hi:HorarioIda, hv:HorarioVolta | some horario.hi and some horario.hv
}

pred show(){}

run show for 5
