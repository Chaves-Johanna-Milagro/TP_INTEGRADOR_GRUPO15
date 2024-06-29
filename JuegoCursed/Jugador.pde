private class Jugador implements IController, IVisualizable{
  private Transform transform;
  private Collider collider;
  private Animador jugador;
  private int vida;
  private int puntaje;
  private PImage imagen;
  
  //Variables de movimiento
  private boolean upPressed;
  private boolean downPressed;
  private boolean rightPressed;
  private boolean leftPressed;
  private int velocidad;
  
  private int estadoJugador;//variable para la maquina de estados del jugador

  //constructor
  public Jugador(float x, float y,int velocidad){
    this.transform=new Transform(x,y);
    this.jugador=new Animador(x,y,4);//recibe la posicion y el numero de frames
    this.jugador.crearAnimacion("spritesJugador.png"); 
    this.velocidad=velocidad;
    
    
    this.imagen=loadImage("spritesJugador.png");
    this.estadoJugador=StateJugador.IDLE;//se establece el estado del jugador como "Quieto"
    
    this.collider=new Collider(16.0, this.transform.getPosicion());
  }
  
  //metodo de dibujo
  public void display(){
   
    this.jugador.setPosicion(this.transform.getPosicion().x,this.transform.getPosicion().y);//actualizacion de la posicion del sprite para que acompañe el movimiento
  
    //Dependiendo el estado del jugador, el sprite estara quieto o en movimiento
    switch (this.estadoJugador){
      case 1:
        image(this.imagen.get(0,0,32,32), this.transform.getPosicion().x,this.transform.getPosicion().y,50,50);
        break;
      case 2:
        jugador.updateAnimacion();
        break; 
    }
    
    this.mover();
  }
  
  //Movimiento del jugador controlado por los inputs
  public void mover(){
    if (rightPressed==true){
     this.transform.setPosicion(this.transform.getPosicion().x+velocidad*Time.getDeltaTime(frameRate), this.transform.getPosicion().y);//actualizacion posicion del objeto
     this.estadoJugador=StateJugador.MOVIENDO;//se cambia el estado del jugador para activar la animacion del sprite
    }
    if (leftPressed==true){
      this.transform.setPosicion(this.transform.getPosicion().x-velocidad*Time.getDeltaTime(frameRate), this.transform.getPosicion().y);
      this.estadoJugador=StateJugador.MOVIENDO;
    }
    if (upPressed==true){
      this.transform.setPosicion(this.transform.getPosicion().x,this.transform.getPosicion().y-velocidad*Time.getDeltaTime(frameRate));
      this.estadoJugador=StateJugador.MOVIENDO;
    }
    if (downPressed==true){
      this.transform.setPosicion(this.transform.getPosicion().x,this.transform.getPosicion().y+velocidad*Time.getDeltaTime(frameRate));
      this.estadoJugador=StateJugador.MOVIENDO;
    }
  
  }
  //se utilizara para los movimientos del jugador
  public void readCommand(){
    if (keyCode==UP){
      upPressed=true;
    }
    if (keyCode==DOWN){
      downPressed=true;
    }
    if (keyCode==RIGHT){
      rightPressed=true;
    }
    if (keyCode==LEFT){
      leftPressed=true;
    }  
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
   
   public void setEstado(int est){
     this.estadoJugador=est;
   }
   
   
  //Setters y getters de las teclas direccionales 
   public boolean getUpPressed(){
    return this.upPressed;
  }
  public void setUpPressed(boolean upPressed){
    this.upPressed=upPressed;
  }
  
  public boolean getDownPressed(){
    return this.downPressed;
  }
  public void setDownPressed(boolean downPressed){
    this.downPressed=downPressed;
  }
  
  public boolean getRightPressed(){
    return this.rightPressed;
  }
  public void setRightPressed(boolean rightPressed){
    this.rightPressed=rightPressed;
  }
  
  public boolean getLeftPressed(){
    return this.leftPressed;
  }
  public void setLeftPressed(boolean leftPressed){
    this.leftPressed=leftPressed;
  }
  
}
