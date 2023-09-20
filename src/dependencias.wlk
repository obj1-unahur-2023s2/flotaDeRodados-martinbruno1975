import rodados.*
import pedidos.*

class Dependencia {
	var property cantidadEmpleados = 0
	const pedidos = []
	const rodados = []
	
	method agregarAFlota(rodado) {
		rodados.add(rodado)
	}
	
	method quitarDeFlota(rodado) {
		rodados.remove(rodado)
	}
	
	method pesoTotalFlota() {
		return rodados.sum({r => r.peso()})
	}
	
	method todosSuperanXVelocidad(velocidad){
		return rodados.all({r => r.velocidad() >= velocidad})
	}
	
	method estaBienEquipado() {
		return rodados.size() >= 3 and self.todosSuperanXVelocidad(100) 
	}
	
	method capacidadTotalEnColor(color) {
		return self.rodadosDeUnColor(color).sum({r => r.capacidad()})
	}
	
	method rodadosDeUnColor(unColor) {
		return rodados.filter({r => r.color() == unColor})
	}
	
	method colorDelRodadoMasRapido() {
		return self.rodadoMasRapido().color()
	}
	
	method rodadoMasRapido() {
		if (rodados.isEmpty()) {
			self.error("No se puede calcular el maximo")
		}
		return rodados.max({r => r.velocidad()})
	}
	
	method capacidadTotalEnColor(color) {
		return 
	}
	
	method capacidadDeLaFlota() {
		return rodados.sum({r => r.capacidad()})
	}
	
	method capacidadFaltante() {
		return 0.max(cantidadEmpleados - self.capacidadDeLaFlota())	
	}
	
	method esGrande() {
		return cantidadEmpleados >= 40 and rodados.size() >= 5	
	}
	
	method ningunoSatisface(pedido) {
		return rodados.all({r => not pedido.puedeSerSatisfechoPor(r)})
		/* return not rodados.any({r => pedido.puedeSerSatisfechoPor(r)})*/
	}
	
	method pedidosInstatisfechos() {
		return pedidos.filter({p => self.ningunoSatisface(p)})
	}
}
