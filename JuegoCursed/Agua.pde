private class Agua implements IVisualizable {
  private Transform transform;
  private Collider collider;
  private Animador awita;
  private float velocidad;
  
  private AudioPlayer enemigoDerrotado;//variable de audio cuando un enemigo sea impactado

  //constructor
  public Agua(float x, float y, float velocidad) {
    this.transform=new Transform(x, y);
    this.velocidad=velocidad;
    this.collider=new Collider(20.0, this.transform.getPosicion());
    
    //carga archivo de audio
    this.enemigoDerrotado = minim.loadFile("enemigoDerrotado.wav");
  }

  //metodo de dibujo
  public void display() {
    this.awita=new Animador(this.transform.getPosicion().x, this.transform.getPosicion().y, 2);//recibe la posicion y el numero de frames
    this.awita.crearAnimacion("spriteAgua.png");
    awita.updateAnimacion();
    
  }

  //movera el agua utilizando el delta time
  public void mover() {
    PVector pos=transform.getPosicion();
    transform.setPosicion(pos.x+this.velocidad*Time.getDeltaTime(frameRate), pos.y); 
    this.updateCollider();
  }
  //actualizara el movimiento del agua
  private void updateCollider() {
    PVector pos=transform.getPosicion();
    collider.setPosicion(pos.x, pos.y);
  }
  
  public void destruyeEnemigo(Enemigo victima){
  
    boolean isCollide = this.collider.verificarColision(victima.getCollider());

    if (isCollide==true) {
      
      enemigoDerrotado.rewind();//se reproduce el sonido del enemigo impactado
      enemigoDerrotado.play();
      
      ArrayList<Enemigo> listaEnemigo =  new ArrayList<Enemigo>();
      
      listaEnemigo=getListaEnemigo();
      
      int posicion = listaEnemigo.indexOf(victima);//obtiene la posicion en la lista del enemigo colisionado
      listaEnemigo.remove(posicion);//elimina dicho enemigo
      
      setListaEnemigo(listaEnemigo);//se envia la lista modificada a juegocursed
    }
    
  }
  
  
  
  //getters y setters
  public Collider getCollider() {
    return collider;
  }

  public float getVelocidad() {
    return velocidad;
  }

  public float getTransformX() {
    return transform.getPosicion().x;
  }
}
