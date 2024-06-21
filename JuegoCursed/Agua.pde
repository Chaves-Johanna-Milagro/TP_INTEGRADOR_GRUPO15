private class Agua extends GameObject{

  
  private int valor;
  private Collider collider;
  private Animador awita;
  
  public Agua(PVector posicion){
    this.awita=new Animador(posicion.x,posicion.y,2);//recibe la posicion y el numero de frames
    this.awita.crearAnimacion("spritesAgua.png"); 
    
  
  }
  
  public void display(){
   awita.updateAnimacion();
  }
  
  public PVector getPosicion(){
  return posicion;}
  
  public void setPosicion(PVector posicion){
  this.posicion=posicion;}
}
