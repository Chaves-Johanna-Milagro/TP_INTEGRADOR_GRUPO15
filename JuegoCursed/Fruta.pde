private class Fruta implements IVisualizable{
  private Transform transform;
  private int valor;
  private Collider collider;
  private Animador frutita;
  
  public Fruta(float x, float y){
    this.transform=new Transform(x,y);
    this.frutita=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.frutita.crearAnimacion("spriteFruta1.png"); 
  
  }
  
  public void display(){
    frutita.updateAnimacion();
  
  }
}
