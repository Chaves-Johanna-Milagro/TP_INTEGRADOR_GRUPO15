private class Agua implements IVisualizable{
  private Transform transform;
  
  private int valor;
  private Collider collider;
  private Animador awita;
  
  public Agua(float x, float y){
    this.transform=new Transform(x,y);
    this.awita=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.awita.crearAnimacion("spriteAgua.png"); 
    
  
  }
  
  public void display(){
   awita.updateAnimacion();
  }
  
  
}
