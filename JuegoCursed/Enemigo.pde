private class Enemigo implements IVisualizable{
  private Transform transform;
  private int velocidad;
  private int direccion;//Indica si el enemigo se moverá arriba/abajo o derecha/izquierda
  private Collider collider;
  private Animador enemy;
  
  //constructor
  public Enemigo(float x, float y,int velocidad, int direccion){
    this.transform=new Transform(x,y);
    this.enemy=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.enemy.crearAnimacion("spritesEnemigo.png");
    
    this.velocidad=velocidad;
    this.direccion=direccion;
    
    this.collider=new Collider(20.0, this.transform.getPosicion());
  }
  
  //metodo de dibujo
  public void display(){
  this.enemy.setPosicion(this.transform.getPosicion().x,this.transform.getPosicion().y);//actualizacion de la posicion del sprite para que acompañe el movimiento
  enemy.updateAnimacion();
  
  this.mover();

  }
  
  //metodo de movimiento
  public void mover(){
    
    //Dependiendo la direccion el enemigo se moverá hacia los bordes de la pantalla y rebotará
    if (this.direccion==1) {
      if (this.transform.getPosicion().x > width-32 || this.transform.getPosicion().x < 0) {
        this.velocidad = -this.velocidad;
      }
      this.transform.setPosicion(this.transform.getPosicion().x+=this.velocidad*Time.getDeltaTime(frameRate), this.transform.getPosicion().y);
    }
    if (this.direccion==2) {
      if (this.transform.getPosicion().y > height-32 || this.transform.getPosicion().y < 0) {
        this.velocidad = -this.velocidad;
      }
      this.transform.setPosicion(this.transform.getPosicion().x, this.transform.getPosicion().y+=this.velocidad*Time.getDeltaTime(frameRate));
    }
  
  }
  
  //Verificación si el enemigo choca con jugador
  public void atacaJugador(Jugador jugador){
    boolean isCollide = this.collider.verificarColision(jugador.getCollider());

    if (isCollide==true) {
      estado=StateMachine.DERROTADO;
    }
  }
}
