private class Fondo implements IVisualizable {
  private Transform transform;
  private PImage pantallaInicio;
  private PImage fondo;

  public Fondo() {  //reduce parte del codigo
    this.transform= new Transform(0,0);
    pantallaInicio = loadImage("pantallaInicio.png");
    fondo = loadImage("fondo.png");
  }

  public void display() {
    image(fondo,this.transform.getPosicion().x,this.transform.getPosicion().y);

    //Cambia el fondo según el estado del StateMachine
    switch (estado) {
    case 1:
      image(pantallaInicio, this.transform.getPosicion().x, this.transform.getPosicion().y);
      break;
    case 2:
      image(fondo, this.transform.getPosicion().x, this.transform.getPosicion().y);
      break;
    case 3:
      break;
    case 4:
      break;
    }
  }
}
