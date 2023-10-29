import wollok.game.*
import comidas.*

object gatito {
	var comidasAtrapadas = 0
	var comidasEspeciales = 0
	var comidasDaninas = 0
	
	var property position = game.at(5,2)
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
	
	method comer() {
		comidasAtrapadas++
		/* si llega a 10 crece */
	}
	
	method comerComidaEspecial() {
		comidasAtrapadas++
		comidasEspeciales++
		/* si llega a 5 gana */
	}
	
	method comerComidaDanina() {
		comidasDaninas++
		/* si llega a 3 pierde */
	}
	
	method image() = "assets/gatito_prueba.png"
}