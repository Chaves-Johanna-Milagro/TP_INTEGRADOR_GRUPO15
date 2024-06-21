private class Fruta extends GameObject implements IVisualizable{
  
  private int valor;
  private Collider collider;
  private Animador frutita;
  
  public Fruta(PVector posicion){
    this.frutita=new Animador(posicion.x,posicion.y,2);//recibe la posicion y el numero de frames
    this.frutita.crearAnimacion("spritesFruta.png"); 
  
  }
  
  public void display(){
    frutita.updateAnimacion();
  
  }
}
