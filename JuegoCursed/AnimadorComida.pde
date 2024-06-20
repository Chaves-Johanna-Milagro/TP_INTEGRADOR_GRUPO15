class AnimadorComida{
  //el sprite es la imagen completa que contiene los angulos de movimiento
  //el frame es cada pequeña imagen que esta dentro del sprite
  private PVector posicion;
  private PImage sprite;     
  private int anchoSprite;   //ancho del frame del sprite
  private int altoSprite;  //alto del frame del sprite
  private int numFrames;   //numero total de frames del sprite
  private int frameActual=0;  //ira actualizandose a medida de la cantidad de frames del sprite
  private int frameDelay=5;  //tiempo o retraso entre frames
  private int frameCount=0;  //contador de frames
  
  //constructor
  public AnimadorComida(){     
  }
  
  //este obtendra los frames del sprite y sera inicializado indirectamente dentro del setup()
   public void crearAnimacion(){
   }
   
   // mostrara sucesivamente los frames del sprite para dar la sensacion de movimiento
   //y sera inicializado indirectamente dentro del draw()
   public void updateAnimacion(){
   }

}
