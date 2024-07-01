private class Collider{
  private Transform transform;
  private float radio;
  private PVector posCentro;
  
  public Collider(float radio,PVector posCentro){
    this.transform=new Transform(posCentro.x,posCentro.y);
    this.radio=radio;
    this.posCentro=posCentro;
  }
  
  //Validación de colisión entre dos objetos con colliders
  public boolean verificarColision(Collider otroCollider){
    
    float distancia= this.posCentro.dist(otroCollider.getPosCentro());
    
  //reduce parte del codigo ya que directamente retorna verdadero si existe la colision
    return distancia<(this.radio + otroCollider.getRadio());

  }
  
  //Setters y getters
  public PVector getPosCentro() {
    return this.posCentro;
  }

  public void setPosCentro(PVector posCentro) {
    this.posCentro=posCentro;
  }

  public float getRadio() {
    return this.radio;
  }
  
  //metodos accesores para la posicion del collider
  public PVector getPosicion(){
    return transform.getPosicion();
 }
  public void setPosicion(float x, float y){
    transform.setPosicion(x,y);
 }
}
