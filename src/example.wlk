import wollok.game.*

object personaje {
	var property position = game.at(5,0)
	
	method moverseALaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseALaDerecha(){
		self.position(position.right(1))
	}
	
	method image() = "assets/gatito.png"
}

// usar clases ?
object comidaGeneral {
	var property position = game.at(6,16)
	var comida = comidas.comidaAlAzar()
	
	method caer() {
		self.position(position.down(1))
	}
	
	method image() = "assets/" + comida.nombre() + ".png"
}

object comidas {
	const listaComidas = [sandwich,papas]
	method comidaAlAzar() = listaComidas.anyOne()
}

object sandwich {
	method nombre() = "sandwich"
}

object papas {
	method nombre() = "papas"
}

/*class ComidaGeneral {
	var property position = game.at(6,16)
	
	method caer() {
		self.position(position.down(1))
	}
	
	method image() = "assets/sandwich.png"
}*/
