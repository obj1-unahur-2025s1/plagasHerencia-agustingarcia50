
import plagas.*

class Hogar {
    var mugre
    const confortQueOfrece
    method esBueno() = mugre <= (confortQueOfrece * 0.5)
    method efectoDelAtaque(unaPlaga) {mugre += unaPlaga.danio()}
}


class Huerta {
    var produccion
    method esBueno() = produccion > nivelMinimo.valor()
    method efectoDelAtaque(unaPlaga){
        produccion -= unaPlaga.danio() *0.1 
        + if (unaPlaga.transmiteEnfermedades()) 10 else 0.max(0)
    }
}


class Mascota {
    const nivelDeSalud
    method esBueno() =  nivelDeSalud >250
    method efectoDelAtaque(unaPlaga){
        if (unaPlaga.transmiteEnfermedades()) {nivelDeSalud= (nivelDeSalud - unaPlaga.danio()).max(0)}
    }
}

object nivelMinimo {
    var property valor= 100

}


class Barrio {
    const elementos = []
    method agregarElementos(elementos) {elementos.addAll(elementos)}
    method esCopado() = self.cantidadDeElementosBuenos() > self.cantidadDeElementosNoBuenos()
    method cantidadDeElementosBuenos() = elementos.count({e=>e.esBueno()})  
    method cantidadDeElementosNoBuenos()=  elementos.count({e=>not e.esBueno()}) 
}