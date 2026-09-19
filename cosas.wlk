object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var peso = 0 

	method peso() {
		return peso
	}

	method asignarPeso(_peso) {
		peso = _peso
	}

	method nivelPeligrosidad() { return 1 }
}

object bumblebee {
	const estadoTransformacion = auto 
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return if (estadoTransformacion == auto){
			15 
		} else {
			30
		}
	}

	method name() {
	  
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

	method asignarCantidadantidad(_cantidad) {
		cantidad = _cantidad
	}
}

object bateriaAntiaera {
	var tieneMisiles = true

	method nivelPelirosidad() {
		return if(tieneMisiles) { 100 } else { 0 }
	}

	method peso() {
		return if(tieneMisiles) { 300 } else { 200 }
	}
}


object residuosRadioactivos {
	var peso = 0 

	method peso() {
		return peso
	}

	method asignarPeso(_peso) {
		peso = _peso
	}

	method peligrosidad() { return 200 }
}