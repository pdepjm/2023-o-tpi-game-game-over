import wollok.game.*
import gatito.*
import configuraciones.*

class Comida {
	// todas las posiciones de donde puede caer la comida
	const posiblesX = [0,2,4,6,8,10,12]
	var property position = game.at(posiblesX.anyOne(),16)
	
	method caerUnaPosicion() {
		self.position(position.down(1))
		if(game.hasVisual(self) && position.y() == tablero.limiteInferior()) {
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
		gatito.modificarVidas(+1)
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

class ComidaEspecial inherits Comida {
	const comidasEspaciales = ["helado","sushi","whiskas"]
	const imagenActual = comidasEspaciales.anyOne()
	
	override method generarEfecto() {
		gatito.modificarVidas(+2)
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

class ComidaDanina inherits Comida {
	const comidasDaninas = ["helado_enojado","manzana_podrida","veneno"]
	const imagenActual = comidasDaninas.anyOne()
	
	method imagenActual() = imagenActual
	
	override method generarEfecto() {
		gatito.modificarVidas(-2)
	}
	
	override method caer() {
		game.onTick(280,"", {self.caerUnaPosicion()})
	}
	
	override method image() = "assets/" + imagenActual + ".png"
}

class Bomba inherits ComidaDanina {
	
	override method generarEfecto() {
		gatito.modificarVidas(-(gatito.vidas()))
	}
	
	override method image() = "assets/bomba.png"
}

object generador {
	var nuevaComida
	const comidasEnPantalla = []
	
	method generarUnaComida() {
		nuevaComida = self.generarComidaAlAzar()
		comidasEnPantalla.add(nuevaComida)
		game.addVisual(nuevaComida)
		nuevaComida.caer()
	}
	
	method generarComidaAlAzar() {
		return [new ComidaGeneral(),new ComidaEspecial(),new ComidaDanina(),new Bomba()].anyOne()
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
