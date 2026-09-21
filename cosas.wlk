object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var property peso = 0 

	method asignarPeso(_peso) {
		peso = _peso
	}

	method nivelPeligrosidad() { return 1 }
}

object bumblebee {
	var estadoTransformacion = auto 
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return if (estadoTransformacion == auto){ 15 } else { 30 }
	}

	method transformarA(_transformacion) {
		estadoTransformacion = _transformacion
	}
}
object auto {}
object robot {}


object paqueteLadrillos {
	var cantidad = 0 

	method nivelPeligrosidad() { return 2 }

	method peso() {
		return (cantidad * 2)
	}

	method asignarPeso(peso) {
		cantidad = peso
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
}


object residuosRadioactivos {
	var property peso = 0 

	method asignarPeso(_peso) {
		peso = _peso
	}

	method peligrosidad() { return 200 }
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

	method peligrosidad() {
		return if (!objetos.isEmpty()) {
			objetos.filter({cosa => cosa == self.objetoMasPeligroso()}).nivelPeligrosidad()
		} else { 0 } 
	}

	method objetoMasPeligroso() {
		return objetos.max({cosa => cosa.nivelPeligrosidad()})
	}
}