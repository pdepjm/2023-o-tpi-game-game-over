import wollok.game.*
import comidas.*

object gatito {
	var property position = game.at(5,0)
	var comidasAtrapadas = 0
	var comidasEspeciales = 0
	var comidasDaninas = 0
	
	/* ESTABLECER LOS LÍMITES DEL TABLERO */

	method moverseALaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseALaDerecha(){
		self.position(position.right(1))
	}
	
	/*method atraparComida(comidaAtrapada) {
		comidaAtrapada.generarEfecto()
	}*/
	
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
	
	method image() = "assets/gatito.png"
}