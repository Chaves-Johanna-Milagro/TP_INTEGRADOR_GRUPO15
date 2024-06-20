private class Agua extends GameObject{
  private PVector posicion;
  
  private int valor;
  private Collider collider;
  private AnimadorComida awita;
  
  public Agua(PVector posicion){
    this.posicion=posicion;
    this.awita=new AnimadorComida(posicion.x,posicion.y);
    this.awita.crearAnimacion(); 
    
  
  }
  
  public void display(){
   awita.updateAnimacion();
  }
  
  public PVector getPosicion(){
  return posicion;}
  
  public void setPosicion(PVector posicion){
  this.posicion=posicion;}
}
