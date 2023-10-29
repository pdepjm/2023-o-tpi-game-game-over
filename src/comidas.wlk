import wollok.game.*
import gatito.*

class Comida {
	// todas las posiciones de donde puede caer la comida
	const posiblesX = [0,2,4,6,8,10,12]
	var property position = game.at(posiblesX.anyOne(),16)
	const limiteInferior = 0
	
	method caerUnaPosicion() {
		self.position(position.down(1))
		/* checkear */
		if(game.hasVisual(self) && position.y() == limiteInferior) {
			generador.eliminarUnaComida(self)
		}
	}
	
	method caer() {
		game.onTick(400,"", {self.caerUnaPosicion()})
	}
	
	method generarEfecto()
	
	method image()
}

class ComidaGeneral inherits Comida {
	const comidasGenerales = ["hamburguesa","papas","pizza","pollo","sandwich","sandwich2","taco"]
	const imagenActual = comidasGenerales.anyOne()
	
	override method generarEfecto() {
		gatito.comer()
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

class ComidaEspecial inherits Comida {
	const comidasEspaciales = []
	var imagenActual = comidasEspaciales.anyOne()
	
	override method generarEfecto() {
		gatito.comerComidaEspecial()
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

class ComidaDanina inherits Comida {
	const comidasDaninas = ["manzana_podrida"]
	const imagenActual = comidasDaninas.anyOne()
	
	override method generarEfecto() {
		gatito.comerComidaDanina()
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

object generador {
	var nuevaComida
	const comidasEnPantalla = []
	
	method generarUnaComida() {
		nuevaComida = self.comidaAlAzar()
		comidasEnPantalla.add(nuevaComida)
		game.addVisual(nuevaComida)
		nuevaComida.caer()
	}
	
	method comidaAlAzar() {
		return [new ComidaGeneral(),new ComidaDanina()].anyOne()
	}
	
	method eliminarUnaComida(comida) {
		game.removeVisual(comida)
		comidasEnPantalla.remove(comida)
	}
}
