private class Jugador implements IController, IVisualizable {
  private Transform transform;
  private Collider collider;
  private Animador jugador;
  private PImage imagen;

  private ArrayList<Agua> agua;

  //Variables de movimiento
  private boolean upPressed;
  private boolean downPressed;
  private boolean rightPressed;
  private boolean leftPressed;
  private int velocidad;

  //variables de audio
  private AudioPlayer comer;
  private AudioPlayer disparo;

  private int estadoJugador;//variable para la maquina de estados del jugador

  //constructor
  public Jugador(float x, float y, int velocidad) {
    this.transform=new Transform(x, y);
    this.jugador=new Animador(x, y, 4);//recibe la posicion y el numero de frames
    this.jugador.crearAnimacion("spritesJugador.png");
    this.velocidad=velocidad;

    this.agua=new ArrayList<Agua>();//inicializa el ArrayList

    this.imagen=loadImage("spritesJugador.png");
    this.estadoJugador=StateJugador.IDLE;//se establece el estado del jugador como "Quieto"

    this.collider=new Collider(20.0, this.transform.getPosicion());

    //carga de los archivos de audio
    this.comer = minim.loadFile("comer.wav");
    this.disparo = minim.loadFile("disparo.wav");
  }

  //metodo de dibujo
  public void display() {

    this.jugador.setPosicion(this.transform.getPosicion().x, this.transform.getPosicion().y);//actualizacion de la posicion del sprite para que acompañe el movimiento
    //dibuja el agua
    for (Agua awita : agua) {
      awita.display();
      awita.mover();
    }
    //Dependiendo el estado del jugador, el sprite estara quieto o en movimiento
    switch (this.estadoJugador) {
    case 1:
      image(this.imagen.get(0, 0, 32, 32), this.transform.getPosicion().x, this.transform.getPosicion().y, 50, 50);
      break;
    case 2:
      jugador.updateAnimacion();
      break;
    }

    this.mover();
  }

  //Movimiento del jugador controlado por los inputs
  public void mover() {
    //reducen algo de codigo y ayudan a establecer los limites de movimiento
    PVector pos=this.transform.getPosicion(); 
    
    float right=pos.x+velocidad*Time.getDeltaTime(frameRate);
    float left=pos.x-velocidad*Time.getDeltaTime(frameRate);
    float up=pos.y-velocidad*Time.getDeltaTime(frameRate);
    float down=pos.y+velocidad*Time.getDeltaTime(frameRate);
    
    if (rightPressed==true) {
      if(right<width-40){
         this.transform.setPosicion(right, pos.y);//actualizacion posicion del objeto
         this.estadoJugador=StateJugador.MOVIENDO;//se cambia el estado del jugador para activar la animacion del sprite
      }
    }
    if (leftPressed==true) {
      if(left>0){
         this.transform.setPosicion(left, pos.y);
         this.estadoJugador=StateJugador.MOVIENDO;
      }
    }
    if (upPressed==true) {
      if(up>0){
         this.transform.setPosicion(pos.x, up);
         this.estadoJugador=StateJugador.MOVIENDO;
      }
    }
    if (downPressed==true) {
      if(down<height-40){
         this.transform.setPosicion(pos.x, down);
         this.estadoJugador=StateJugador.MOVIENDO;
      }
    }
  }
  //se utilizara para los movimientos del jugador
  public void readCommand() {
    if (getEstado()==StateMachine.JUGANDO) {//limita a que el jugador solo pueda moverse o disparar solo cuando se este jugando el nivel
      //dispara si es que se presiona la tecla espacio
      if (key==' ') {
        disparo.rewind();//se reproduce el sonido al disparar
        disparo.play();
        this.disparar();
      }
      if (keyCode==UP) {
        upPressed=true;
      }
      if (keyCode==DOWN) {
        downPressed=true;
      }
      if (keyCode==RIGHT) {
        rightPressed=true;
      }
      if (keyCode==LEFT) {
        leftPressed=true;
      }
    }
  }

  //determinara si el jugador consume una fruta
  public void comer(Fruta comida) {
    boolean isCollide = this.collider.verificarColision(comida.getCollider());

    if (isCollide==true) {

      comer.rewind();//se reproduce el sonido al comer
      comer.play();

      //se crea una nueva arraylist dentro de comer para respetar el encapsulamiento y no acceder directamente a los valores de fruta
      ArrayList<Fruta> listaFruta =  new ArrayList<Fruta>();

      listaFruta=getListaFruta();

      int posicion = listaFruta.indexOf(comida);//obtiene la posicion en la lista de la fruta colisionada
      listaFruta.remove(posicion);//elimina dicha fruta

      setListaFruta(listaFruta);//se envia la lista modificada a juegocursed
    }
  }


  //le permitira al jugador disparar
  public void disparar() {

    agua.add(new Agua(transform.getPosicion().x, transform.getPosicion().y, 200));
    for (int i=agua.size()-1; i>0; i--) {
      Agua awita=agua.get(i);

      //elimina el disparo si se sale del lienzo
      if (awita.getTransformX()>=width) {
        agua.remove(i);
      }
    }
  }

  //Setters y getters
  public int getVelocidad() {
    return velocidad;
  }

  public void setEstado(int est) {
    this.estadoJugador=est;
  }

  public Collider getCollider() {
    return this.collider;
  }

  //Setters y getters de las teclas direccionales
  public boolean getUpPressed() {
    return this.upPressed;
  }
  public void setUpPressed(boolean upPressed) {
    this.upPressed=upPressed;
  }

  public boolean getDownPressed() {
    return this.downPressed;
  }
  public void setDownPressed(boolean downPressed) {
    this.downPressed=downPressed;
  }

  public boolean getRightPressed() {
    return this.rightPressed;
  }
  public void setRightPressed(boolean rightPressed) {
    this.rightPressed=rightPressed;
  }

  public boolean getLeftPressed() {
    return this.leftPressed;
  }
  public void setLeftPressed(boolean leftPressed) {
    this.leftPressed=leftPressed;
  }
  public ArrayList<Agua> getAgua() {
    return agua;
  }
}
