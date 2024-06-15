//Objetos y listas de objetos
private Jugador jugador;
private ArrayList<Enemigo> enemigo;
private ArrayList<Fruta> fruta;
private ArrayList<Agua> agua;
private Fondo fondo;
//Variable para la maquina de estados
private int estado;

public void setup(){
  size(600,600);
  background(0);
  
  fondo=new Fondo();

}

public void draw(){
  
  //Muestra pantalla de inicio provisional
  fondo.display();

}


//Inputs de movimiento del jugador
public void keyPressed(){

}

public void keyReleased(){

}
