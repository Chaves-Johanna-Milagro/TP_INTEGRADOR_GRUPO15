private class Fondo extends GameObject implements IVisualizable {

  private PImage pantallaInicio;
  private PImage fondo;

  public Fondo() {
    this.posicion = new PVector(0, 0);
    pantallaInicio = loadImage("pantallaInicio.png");
    fondo = loadImage("fondo.png");
  }

  public void display() {
    image(fondo, this.posicion.x, this.posicion.y);

    //Cambia el fondo según el estado del StateMachine
    switch (estado) {
    case 1:
      image(pantallaInicio, this.posicion.x, this.posicion.y);
      break;
    case 2:
      image(fondo, this.posicion.x, this.posicion.y);
      break;
    case 3:
      break;
    case 4:
      break;
    }
  }
}
