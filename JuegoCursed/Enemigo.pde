private class Enemigo extends GameObject{

  private int velocidad;
  private Collider collider;
  private Animador enemy;
  
  public Enemigo(PVector posicion){
    this.enemy=new Animador(posicion.x,posicion.y,2);//recibe la posicion y el numero de frames
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
