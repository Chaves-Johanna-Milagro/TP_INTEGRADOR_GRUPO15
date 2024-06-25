private class Enemigo implements IVisualizable{
  private Transform transform;
  private int velocidad;
  private Collider collider;
  private Animador enemy;
  
  public Enemigo(float x, float y){
    this.transform=new Transform(x,y);
    this.enemy=new Animador(x,y,2);//recibe la posicion y el numero de frames
    this.enemy.crearAnimacion("spritesEnemigo.png"); 
  }
  
  public void display(){
  enemy.updateAnimacion();
  }
  
  public void mover(){
  
  }
  
  //Verificación si el enemigo choca con jugador
  public void atacaJugador(Jugador jugador){
  
  }
}
