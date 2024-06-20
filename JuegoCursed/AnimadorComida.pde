class AnimadorComida{
  //el sprite es la imagen completa que contiene los angulos de movimiento
  //el frame es cada pequeña imagen que esta dentro del sprite
  private PVector posicion;
  
  private PImage spriteAgua;   //imagen del sprite
  private PImage[] spritesAgua;  //array que almacena los frames del sprite
  
  private int anchoSprite=32;   //ancho del frame del sprite
  private int altoSprite=32;  //alto del frame del sprite
  private int numFrames=2;   //numero total de frames del sprite
  private int frameActual=0;  //ira actualizandose a medida de la cantidad de frames del sprite
  private int frameDelay=10;  //tiempo o retraso entre frames
  private int frameCount=0;  //contador de frames
  
  //constructor
  public AnimadorComida(float x,float y){
    this.posicion=new PVector(x,y);
    
    
  }
  
  //este obtendra los frames del sprite y sera inicializado indirectamente dentro del setup()
   public void crearAnimacion(){
     this.spriteAgua=loadImage("spritesAgua.png");
     this.spritesAgua=new PImage[numFrames];
     
     for(int i=0;i<numFrames;i++){
     spritesAgua[i]=spriteAgua.get(i*anchoSprite,0,anchoSprite,altoSprite);
     }
   }
   
   // mostrara sucesivamente los frames del sprite para dar la sensacion de movimiento
   //y sera inicializado indirectamente dentro del draw()
   public void updateAnimacion(){
     image(this.spritesAgua[frameActual],this.posicion.x,this.posicion.y,50,50);
     frameCount++;
  if(frameCount>=frameDelay){
     frameActual=(frameActual+1)%numFrames;
     frameCount=0;
  }
   }

}
