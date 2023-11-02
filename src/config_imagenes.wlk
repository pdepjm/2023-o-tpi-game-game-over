import wollok.game.*
import gatito.*

object recuadro {
	method position() = gatito.position().up(4).right(2)
	method image() = "assets/recuadro_transparente.png"
}

object imagenGanar {
	var property position = game.at(3,4)
	method image() = "assets/you_win.png"
}

object imagenPerder {
	var property position = game.at(3,4)
	method image() = "assets/game_over.png"
}

object vidas {
	var property position = game.at(0,13)
	//method image() = "assets/vidasprueba.png"
	method image() = "assets/" + gatito.stringVidas() + ".png"
}
