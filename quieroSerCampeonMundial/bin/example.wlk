
//es el mundial y se pide algo que tenga polimorfismo y al menos un método que sea "quiero ser campeon mundial"
/*object mundial{
  
}
*/


class Seleccion{
	var property nombre 
	var property jugadores
	var property tecnico
	
	method ganoElMundial(){
		return (self.estanFelices() && self.estanMuyCansados() && self.elAgradoEstaALaAltura())
	}
	
	method estanFelices() =	jugadores.all{jugador=> jugador.nivelFelicidad()>=20}

	
	method estanMuyCansados() = jugadores.any{jugador=> jugador.estadoFisico()<=50}
	
	method elAgradoEstaALaAltura() = tecnico.agradoConLaSeleccion() >70
	
	
}

class Persona{
	var property apellido
	var property edad
}


class Jugador inherits Persona{
    var property estadoFisico
    var property nivelFelicidad
	
	method jugarPartido(demandaFisica){
		self.estadoFisico((estadoFisico-demandaFisica).max(0))
	}
}


class Tecnico inherits Persona{
    var property partidosJugados
    var property agradoConLaSeleccion
    
    
     method vivirPartido(){
		partidosJugados++
	}
}

/*
object scaloni inherits Tecnico(apellido="Scaloni",edad=44,seleccion="Argentina",partidosJugados=10){
	var property agradoConLaAlbiceleste = 23
	
}
  */

object dibu inherits Jugador(apellido="Martinez",edad=29,estadoFisico=92,nivelFelicidad=62){
	var property emocion = 25
	var property nivelSalvacion = 40
	
	override method jugarPartido(demandaFisica){
		super(demandaFisica) 
		self.nivelFelicidad((emocion+nivelFelicidad).min(100))
	}

}

	const scaloni = new Tecnico(apellido="Scaloni", edad=44, partidosJugados=26,agradoConLaSeleccion=23)


object pulga inherits Jugador(apellido="Messi",edad=35,estadoFisico=70,nivelFelicidad=51){
	var property loqueGenera = 50

	override method jugarPartido(demandaFisica){
		super(demandaFisica) 
		scaloni.agradoConLaSeleccion(scaloni.agradoConLaSeleccion()+loqueGenera)
	}
}

object eldiego inherits Jugador(apellido="Maradona",edad=1986,estadoFisico=100,nivelFelicidad=100){

	override method jugarPartido(demandaFisica){
		pulga.nivelFelicidad(100)
		dibu.nivelSalvacion(dibu.nivelSalvacion()+demandaFisica)
	}
}
