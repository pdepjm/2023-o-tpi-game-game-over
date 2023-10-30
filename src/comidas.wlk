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
		game.onTick(500,"", {self.caerUnaPosicion()})
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
	const comidasEspaciales = ["helado","sushi","whiskas"]
	const imagenActual = comidasEspaciales.anyOne()
	
	override method generarEfecto() {
		gatito.comerComidaEspecial()
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

class ComidaDanina inherits Comida {
	const comidasDaninas = ["bomba","helado_enojado","manzana_podrida"]
	const imagenActual = comidasDaninas.anyOne()
	
	override method generarEfecto() {
		gatito.comerComidaDanina()
	}
	
	override method caer() {
		game.onTick(300,"", {self.caerUnaPosicion()})
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

/*class ComidaGanadora inherits Comida {
	
	override method image() = "assets/whiskas.png"
}*/

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
		return [new ComidaGeneral(),new ComidaEspecial(),new ComidaDanina()].anyOne()
	}
	
	method eliminarUnaComida(comida) {
		if(game.hasVisual(comida)) {
			game.removeVisual(comida)
			comidasEnPantalla.remove(comida)
		}
	}
	
	method eliminarTodasLasComidas() {
		comidasEnPantalla.forEach({comida => self.eliminarUnaComida(comida)})
	}
}
