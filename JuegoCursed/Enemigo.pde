private class Enemigo extends GameObject{

  private int velocidad;
  private Collider collider;
  private Animador enemy;
  
  public Enemigo(PVector posicion){
    this.enemy=new Animador(posicion.x,posicion.y);
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
