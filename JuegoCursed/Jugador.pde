private class Jugador implements IController, IVisualizable{
  private Transform transform;
  private Collider collider;
  private Animador jugador;
  private int vida;
  private int puntaje;
  private int velocidad;

  //constructor
  public Jugador(float x, float y,int velocidad){
    this.transform=new Transform(x,y);
    this.jugador=new Animador(x,y,4);//recibe la posicion y el numero de frames
    this.jugador.crearAnimacion("spritesJugador.png"); 
    this.velocidad=velocidad;
  }
  
  //metodo de dibujo
  public void display(){
    jugador.updateAnimacion();
  
  }
  
  //Movimiento del jugador controlado por los inputs
  public void mover(){
  
  }
  //se utilizara para los movimientos del jugador
  public void readCommand(){
  }
  
  //determinara si el jugador consume una fruta
  public void comer(Fruta fruta){
  
  }
  
  //le permitira al jugador disparar 
  public void disparar(Agua agua){

  }
  //Setters y getters
   public int getVelocidad(){
   return velocidad;}
  
}
