private class Fruta implements IVisualizable{
  private Transform transform;
  private Collider collider;
  private Animador frutita,frutita1;
  private int valor;
  
  //constructor
  public Fruta(float x, float y){
    this.transform=new Transform(x,y);
    this.frutita=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.frutita.crearAnimacion("spriteFruta1.png"); 
  
    this.collider=new Collider(16.0, this.transform.getPosicion());
  }
  
  //metodo de dibujo
  public void display(){
    frutita.updateAnimacion();
  
  }
  
  //setters y getters
  public Collider getCollider() {
    return this.collider;
  }
}
