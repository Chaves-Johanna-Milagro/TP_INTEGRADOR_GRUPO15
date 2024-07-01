private class Agua implements IVisualizable{
  private Transform transform;
  private Collider collider;
  private Animador awita;
  private int daño;
  private float velocidad;
  
  //constructor
  public Agua(float x, float y,float velocidad){
    this.transform=new Transform(x,y);
    this.velocidad=velocidad;
    this.awita=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.awita.crearAnimacion("spriteAgua.png"); 
    this.collider=new Collider(20.0,this.transform.getPosicion());
    
  }
  
  //metodo de dibujo
  public void display(){
   awita.updateAnimacion();
  }
  
  //movera el agua utilizando el delta time
  public void mover(){
    PVector pos=transform.getPosicion();
    transform.setPosicion(pos.x+this.velocidad*Time.getDeltaTime(frameRate),pos.y);
    this.updateCollider();
  }
  //actualizara el movimiento del agua
  private void updateCollider(){
   PVector pos=transform.getPosicion();
   collider.setPosicion(pos.x,pos.y);
  }
  //getters y setters
  public Collider getCollider(){
  return collider;
 }
  
  public float getVelocidad(){
  return velocidad;
 }
}
