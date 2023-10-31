import wollok.game.*
import comidas.*
import config_imagenes.*

object gatito {
	var vidas = 15

	var property position = game.at(4,1)
	const limiteIzquierdo = -2
	const limiteDerecho = 10

	method moverseALaIzquierda(){
		if (position.x() > limiteIzquierdo) {
			self.position(position.left(1))
		}
	}
	
	method moverseALaDerecha(){
		if (position.x() < limiteDerecho) {
			self.position(position.right(1))
		}
	}

	method cantidadDeVidas() {
		if(vidas >= 40) {
			self.ganar()
		}
		else if(vidas <= 0) {
			self.perder()
		}
	}
	
	method comer() {
		vidas++
		self.cantidadDeVidas()
	}
	
	method comerComidaEspecial() {
		vidas += 2
		self.cantidadDeVidas()
	}
	
	method comerComidaDanina(comidaAtrapada) {
		if (comidaAtrapada.imagenActual() == "bomba") {
			self.perder()
		}
		else {
			vidas -= 2
			self.cantidadDeVidas()
		}
	}
	
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