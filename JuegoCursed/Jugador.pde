private class Jugador implements IController, IVisualizable{
  private Transform transform;
  private int vida;
  private int puntaje;
  private int velocidad;
  private Collider collider;
  private Animador jugador;
  
  public Jugador(float x, float y,int velocidad){
    this.transform=new Transform(x,y);
  this.jugador=new Animador(x,y,4);//recibe la posicion y el numero de frames
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
