private class Agua implements IVisualizable{
  private Transform transform;
  private Collider collider;
  private Animador awita;
  private int daño;
  
  //constructor
  public Agua(float x, float y){
    this.transform=new Transform(x,y);
    this.awita=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.awita.crearAnimacion("spriteAgua.png"); 
    
  }
  
  //metodo de dibujo
  public void display(){
   awita.updateAnimacion();
  }
  
  
}
