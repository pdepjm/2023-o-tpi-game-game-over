import wollok.game.*
import gatito.*

object comida {
	// todas las posiciones de donde puede caer la comida
	const posiblesX = [0,2,4,6,8,10,12]
	// lista con todas las comidas
	const posiblesComidas = [sandwich,papas,manzana]
	
	var property position = game.at(posiblesX.anyOne(),16)
	var comida = self.elegirComidaAlAzar()
	
	method elegirComidaAlAzar() {
		return posiblesComidas.anyOne()
	}
	
	method caer() {
		self.position(position.down(1))
	}
	
	method image() = "assets/" + comida.nombre() + ".png"
}

class ComidaGeneral {
	var nombre
	
	method generarEfecto() {
		gatito.comer()
	}
	
	method nombre() = nombre
}

const sandwich = new ComidaGeneral (nombre="sandwich")
const papas = new ComidaGeneral (nombre="papas")

class ComidaEspecial {
	var nombre
	
	method generarEfecto() {
		gatito.comerComidaEspecial()
	}
	
	method nombre() = nombre
}

class ComidaDanina {
	var nombre
	
	method generarEfecto() {
		gatito.comerComidaDanina()
	}
	
	method nombre() = nombre
}

const manzana = new ComidaDanina (nombre="manzana_podrida")