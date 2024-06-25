private class Jugador extends GameObject implements IController, IVisualizable{

  private int vida;
  private int puntaje;
  private int velocidad;
  private Collider collider;
  private Animador jugador;
  
  public Jugador(PVector posicion,int velocidad){
  this.jugador=new Animador(posicion.x,posicion.y,4);//recibe la posicion y el numero de frames
    this.jugador.crearAnimacion("spritesJugador.png"); 
    this.velocidad=velocidad;
  }
  
  public void display(){
    jugador.updateAnimacion();
  
  }
  
  //Movimiento del jugador controlado por los inputs
  public void mover(){
  
  }
  
  public void readCommand(){
  }
  
  //Control cuando jugador come una fruta
  public void comerFruta(Fruta fruta){
  
  }
  
  //Control cuando jugador come un agua
  public void comerAgua(Agua agua){

  }
   public int getVelocidad(){
   return velocidad;}
  
}
