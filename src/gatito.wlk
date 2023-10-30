import wollok.game.*
import comidas.*

object gatito {
	var vidas = 5
	
	var property position = game.at(5,1)
	const limiteIzquierdo = 0
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
	
	method checkearVidas() {
		if(vidas == 10) {
			self.ganar()
		}
		else if(vidas <= 0) {
			self.perder()
		}
	}
	
	method comer() {
		vidas++
		self.checkearVidas()
	}
	
	method comerComidaEspecial() {
		vidas += 2
		self.checkearVidas()
	}
	
	method comerComidaDanina() {
		vidas -= 3
		self.checkearVidas()
	}
	
	method ganar() {
		game.removeTickEvent("Generar Comidas")
		generador.eliminarTodasLasComidas()
		//game.addVisual() /* imagen que diga que se ganó */
	}
	
	method perder() {
		game.removeTickEvent("Generar Comidas")
		generador.eliminarTodasLasComidas()
		//game.addVisual() /* imagen que diga que se perdió */
	}
	
	method image() = "assets/gatito.png"
}