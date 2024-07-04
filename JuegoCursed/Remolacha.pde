private class Remolacha extends Fruta{
  private Transform transform;
  private Collider collider;
  private Animador animador;
  
  
  public Remolacha(float x,float y){
  this.transform=new Transform(x,y);
  this.collider=new Collider(20.0,this.transform.getPosicion());
  this.animador=new Animador(x,y,2); //recibe la posicion y el numero de frames
  animador.crearAnimacion("spriteFruta2.png");}
  
  public void display(){
    animador.updateAnimacion();
  }



}
