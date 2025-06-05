import elementos.*

class Plaga {
    var poblacion
    method transmiteEnfermedades()= poblacion>=10
    method efectoDeAtacar(){
        poblacion+= (poblacion*0.1)
    }
    method atacar(unElemento) {
        unElemento.efectoDelAtaque(self)
        self.efectoDeAtacar()
    }
}

class Cucarachas inherits Plaga {
    
    var pesoPromedioBicho
    method danio()= poblacion / 2
    override method transmiteEnfermedades()= super() && pesoPromedioBicho>=10
    override method efectoDeAtacar(){ 
        super()
        pesoPromedioBicho+= 2
    }
  
}

class Pulgas inherits Plaga{
    
    method danio()= poblacion * 2
    
}

class Mosquitos inherits Plaga {

    method danio()= poblacion
    override method transmiteEnfermedades()= super() && 
    poblacion % 3 == 0 


}

class Garrapatas inherits Pulgas {
    override method efectoDeAtacar(){ 
        super()
        poblacion += (poblacion*0.2)
    }
}

