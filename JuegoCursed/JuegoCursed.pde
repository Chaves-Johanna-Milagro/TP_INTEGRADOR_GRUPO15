//Objetos y listas de objetos
private Jugador jugador;
private ArrayList<Enemigo> enemigo;
private ArrayList<Fruta> fruta;
private ArrayList<Agua> agua;
private Fondo fondo;
//Variable para la maquina de estados
private int estado;
private Agua agua1;
public void setup(){
  size(600,600);
  background(0);
  
  fondo=new Fondo();
  agua1=new Agua(new PVector(200,200)); //prueba animacion
}

public void draw(){
  agua1.display();
  
  //Muestra pantalla de inicio provisional
  //fondo.display();

}


//Inputs de movimiento del jugador
public void keyPressed(){

}

public void keyReleased(){

}
