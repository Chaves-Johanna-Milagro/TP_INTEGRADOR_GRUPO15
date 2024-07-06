private class Fondo implements IVisualizable {
  private Transform transform;
  private PImage pantallaInicio;
  private PImage fondo;
  private PImage derrotado;
  private PImage ganado;

  public Fondo() {  //reduce parte del codigo
    this.transform= new Transform(0, 0);
    pantallaInicio = loadImage("pantallaInicio.png");
    fondo = loadImage("fondo1.png");
    derrotado = loadImage("derrotado.png");
    ganado = loadImage("ganado.png");
  }

  //metodo de dibujo
  public void display() {
   //image(fondo, this.transform.getPosicion().x, this.transform.getPosicion().y);

    //Cambia el fondo según el estado del StateMachine
    switch (estado) {
    case 1:
      image(pantallaInicio, this.transform.getPosicion().x, this.transform.getPosicion().y);
      break;
    case 2:
      //image(fondo, this.transform.getPosicion().x, this.transform.getPosicion().y);
      break;
    case 3:
      image(derrotado, this.transform.getPosicion().x, this.transform.getPosicion().y);
      break;
    case 4:
      image(ganado, this.transform.getPosicion().x, this.transform.getPosicion().y);
      break;
    }
  }
  //permite que el fondo se desplaze siguiendo al jugador
  public void seguirMovimiento(Jugador j){
  float posX=0-j.transform.getPosicion().x;
  float posY=0-j.transform.getPosicion().y;
  
   image(fondo,posX,posY);  
  
  }
}
