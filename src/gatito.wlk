import wollok.game.*
import comidas.*
import configuraciones.*

object gatito {
	var vidas = 7

	var property position = game.at(4,1)

	method moverseALaIzquierda(){
		if (position.x() > tablero.limiteIzquierdo()) {
			self.position(position.left(1))
		}
	}
	
	method moverseALaDerecha(){
		if (position.x() < tablero.limiteDerecho()) {
			self.position(position.right(1))
		}
	}
	
	method modificarVidas(cantidad) {
		vidas += cantidad
		self.comprobarCantidadDeVidas()
	}

	method comprobarCantidadDeVidas() {
		if(vidas >= 40) {
			self.ganar()
		}
		else if(vidas <= 0) {
			self.perder()
		}
	}
	
	method vidas() = vidas
	
	method stringVidas() = vidas.toString()
	
	method ganar() {
		self.eliminarImagenes()
		game.addVisual(imagenGanar)
	}
	
	method perder() {
		self.eliminarImagenes()
		game.addVisual(imagenPerder)
	}
	
	method eliminarImagenes() {
		game.removeTickEvent("Generar Comidas")
		generador.eliminarTodasLasComidas()
		game.removeVisual(self)
	}
	
	method image() = "assets/gatito.png"
}