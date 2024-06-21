private class Fondo extends GameObject implements IVisualizable{
  
  private PImage fondo;
  
  public Fondo(){
    this.posicion=new PVector(0,0);
    fondo = loadImage("fondo.png");
  }
  
  public void display(){
    image(fondo,this.posicion.x,this.posicion.y);
  }
}
