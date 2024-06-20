private class Fruta extends GameObject{
  
  private int valor;
  private Collider collider;
  private Animador frutita;
  
  public Fruta(PVector posicion){
    this.frutita=new Animador(posicion.x,posicion.y);
    this.frutita.crearAnimacion("spritesFruta.png"); 
  
  }
  
  public void display(){
    frutita.updateAnimacion();
  
  }
}
