//funciona parecido a GameObject
//al poner float x,float y; nos ahorramos el poner new PVector
//cada que asignamos la posicion a los objetos
class Transform{  
 private PVector posicion;
  
  public Transform(float x,float y){  //reduce parte del codigo 
  this.posicion=new PVector(x,y);
 }

  //Setters y getters
  public PVector getPosicion(){
    return posicion;
 }
  
  public void setPosicion(float x,float y){ //reduce parte del codigo
    this.posicion.set(x,y);
 }
}
