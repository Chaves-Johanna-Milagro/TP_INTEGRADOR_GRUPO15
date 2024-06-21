//Objetos y listas de objetos
private Jugador jugador;
private ArrayList<Enemigo> enemigo;
private ArrayList<Fruta> fruta;
private ArrayList<Agua> agua;
private Fondo fondo;
//Variable para la maquina de estados
private int estado;
//se utilizaron para probar la animacion
private Agua agua1;  
private Fruta fruta1;
private Enemigo enemigo1;

public void setup(){
  size(600,600);
  background(0);
  
  fondo=new Fondo();
  //pruebas de animacion
  agua1=new Agua(new PVector(200,200)); 
  fruta1=new Fruta(new PVector(100,100));
  enemigo1=new Enemigo(new PVector(400,400));
  jugador=new Jugador(new PVector(100,200),10);
}

public void draw(){
  background(0);
  //pruebas de dibujo
  fondo.display();
  agua1.display();
  fruta1.display();
  enemigo1.display();
  jugador.display();
  
  //Muestra pantalla de inicio provisional
  //fondo.display();

}


//Inputs de movimiento del jugador
public void keyPressed(){
 

}

public void keyReleased(){

}
