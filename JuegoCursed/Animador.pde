class Animador{
  //el sprite es la imagen completa que contiene los angulos de movimiento
  //el frame es cada pequeña imagen que esta dentro del sprite
  private PVector posicion;
  
  private PImage sprite;   //imagen del sprite
  private PImage[] sprites;  //array que almacena los frames del sprite
  
  private int anchoSprite=32;   //ancho del frame del sprite
  private int altoSprite=32;  //alto del frame del sprite
  private int numFrames;   //numero total de frames del sprite
  private int frameActual=0;  //ira actualizandose a medida de la cantidad de frames del sprite
  private int frameDelay=10;  //tiempo o retraso entre frames
  private int frameCount=0;  //contador de frames
  
  //constructor
  public Animador(float x,float y,int numFrames){
    this.posicion=new PVector(x,y);
    this.numFrames=numFrames;
  }
  
  //este obtendra los frames del sprite y sera inicializado indirectamente dentro del setup()
   public void crearAnimacion(String path){
     this.sprite=loadImage(path);
     this.sprites=new PImage[this.getNumFrames()];
     
     for(int i=0;i<this.getNumFrames();i++){
     sprites[i]=sprite.get(i*anchoSprite,0,anchoSprite,altoSprite);
     }
   }
   
   // mostrara sucesivamente los frames del sprite para dar la sensacion de movimiento
   //y sera inicializado indirectamente dentro del draw()
   public void updateAnimacion(){
     image(this.sprites[frameActual],this.posicion.x,this.posicion.y,50,50);
     frameCount++;
  if(frameCount>=frameDelay){
     frameActual=(frameActual+1)%this.getNumFrames();
     frameCount=0;
  }
   }
   
   //Setters y getters
   public int getNumFrames(){
   return numFrames;}
   
   public void setNumFrames(int numFrames){
   this.numFrames=numFrames;}


  public void setPosicion(float x,float y){
    this.posicion.set(x,y);
 }
}
