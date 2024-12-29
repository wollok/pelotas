import wollok.game.*

object lionel {

  var property position = game.at(game.center().x(), 1)
  var property cantidad = 0
  method image() = "lionel.png"
  method text() = cantidad.toString()

  method izquierda() {
    if (self.position().x() > 0 and manager.jugando()) {
      position = position.left(1)
    }
  }
  method derecha() {
    if (self.position().x() < game.width() - 1 and manager.jugando()) {
      position = position.right(1)
    }
  }

  method impacto(pelota) {
    cantidad += 1
    pelotas.remove(pelota)
  }

}

class Pelota {
  method image() = "pelota.png"
  var property position

  method caer() {
    position = position.down(1)
    if (position.y() <= 0) {
      manager.terminar()
    }
  }
}

object manager {

  var property jugando = true

  method position() = game.at(0,0)
  method text() = "Highscore:" + self.highscore().toString()

  method terminar() {
    game.removeTickEvent("CAER")
    game.removeTickEvent("VELOCIDAD")
    jugando = false
    game.say(lionel, "Recolecté " + lionel.cantidad() + " pelotas.")
    if (lionel.cantidad() > self.highscore())
      self.saveHighscore(lionel.cantidad())
    game.schedule(3000, { game.stop() })

  }

  method saveHighscore(newHighscore) native
  method highscore() native


}

object pelotas {

  var velocity = 2000
  const pelotas = []

  method addOnTick() {
      game.onTick(velocity, "CAER", { self.agregarPelota() } )
  }

  method agregarPelota() {
    const position = game.at( 0.randomUpTo(game.width() -1).coerceToInteger()  , game.height() )
    const pelota = new Pelota(position = position)
    console.println("Agregando pelota en " + position)
    game.addVisual(pelota)
    pelotas.add(pelota)
    pelotas.forEach { pelota => pelota.caer() }
  }

  method remove(pelota) {
    pelotas.remove(pelota)
    game.removeVisual(pelota)
  }

  method aumentarVelocidad() {
    game.removeTickEvent("CAER")
    velocity = velocity * 0.9
    self.addOnTick()
  }

}