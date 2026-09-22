object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
	method sufrirAccidente() {}
}

object arenaAGranel {
	var property peso = 0 

	method asignarPeso(_peso) {
		peso = _peso
	}

	method nivelPeligrosidad() { return 1 }
	method bultos() = 1

	method sufrirAccidente() {
		peso += 20
	}
}

object bumblebee {
	var property estaEnModoAuto = true
	method peso() { return 800 }
	method bultos() = 2
	method nivelPeligrosidad() { 
		return if (estaEnModoAuto){ 15 } else { 30 }
	}

	method sufrirAccidente() {
		estaEnModoAuto = !estaEnModoAuto
	}
}
object auto {}
object robot {}
object cosaVacia {}


object paqueteLadrillos {
	var cantidad = 0 

	method nivelPeligrosidad() { return 2 }

	method peso() {
		return (cantidad * 2)
	}

	method asignarPeso(peso) {
		cantidad = peso
	}

	method bultos() {
		if (cantidad <= 100) {
			return 1
		} else if (cantidad <= 300) {
			return 2
		} else {
			return 3
		}
  	}

	method sufrirAccidente() {
		cantidad = 0.max(cantidad - 12)
	}
}

object bateriaAntiaera {
	var tieneMisiles = false

	method nivelPelirosidad() {
		return if(tieneMisiles) { 100 } else { 0 }
	}

	method peso() {
		return if(tieneMisiles) { 300 } else { 200 }
	}

	method cargarMisiles() {
		tieneMisiles = true
	}

	method bultos() {
		if (tieneMisiles) {
			return 2
		} else {
			return 1
		}
	}

	method sufrirAccidente() {
		tieneMisiles = false
	}
}


object residuosRadioactivos {
	var property peso = 0 

	method asignarPeso(_peso) {
		peso = _peso
	}

	method peligrosidad() { return 200 }
	method bultos() = 1

	method sufrirAccidente() {
		peso += 15
	}
}

object contenedorPortuario {
	var objetos =  #{}
	const pesoBase = 100

	method peso() {
		return pesoBase + self.pesoObjetos()
	}

	method pesoObjetos() {
		return objetos.sum({objeto => objeto.peso()})
	}

	method cargar(unaCosa) {
		objetos.add(unaCosa)
	}

	method descargar(unaCosa){
		objetos.remove(unaCosa)
	}

	method nivelPeligrosidad() {
		return if (!objetos.isEmpty()) {
			objetos.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
		} else { 0 } 
	}

	method bultos() {
		return 1 + objetos.sum({ cosa => cosa.bultos() })
	}

	method sufrirAccidente() {
		objetos.forEach({ cosa => cosa.sufrirAccidente() })
	}
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = cosaVacia

	method bultos() = 2
	method sufrirAccidente() {}
	
	method envolver(cosa) {
		cosaEnvuelta = cosa
	}

	method peso(){
		return cosaEnvuelta.peso()
	}

	method nivelPeligrosidad(){
		return cosaEnvuelta.nivelPeligrosidad() / 2
	}
}