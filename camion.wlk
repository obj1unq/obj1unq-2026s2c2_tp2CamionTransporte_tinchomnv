import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMax = 2500
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => self.pesoEsPar(cosa.peso())})
	}

	method pesoEsPar(peso) {
		return peso % 2 == 0 
	}

	method algunoPesa(_peso) {
		return cosas.any({cosa => _peso == cosa.peso() })
	}

	method pesoCargado() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method pesoTotal() {
		return self.pesoCargado() + tara
	}

	method estaExedidoDePeso() {
		return self.pesoTotal() > pesoMax
	}

	method cargaConNivel(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method cosasMasPeligrosasQue(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method puedeCircularEnRuta(nivel) {
		not self.estaExedidoDePeso() && self.cosasMasPeligrosasQue(nivel).isEmpty()
	}

	method algoEnRangoDePeso(min, max) {
		return cosas.filter({cosa => cosa.peso() > min && cosa.peso() < max})	
	}

	method elementoMasPesado() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesosDeElementos() {
		return cosas.map({cosa => cosa.peso()})
	}

	method cantidadDeBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}

	method sufrirAccidente() {
  		cosas.forEach({ cosa => cosa.sufrirAccidente() })
	}
}

