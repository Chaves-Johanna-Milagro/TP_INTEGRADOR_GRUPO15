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

public void setup() {
  size(600, 600);
  background(0);

  fondo=new Fondo();

  //Se establece el stateMachine en 1 para mostrar la pantalla de inicio
  estado=StateMachine.INICIO;

  //pruebas de animacion
  agua1=new Agua(200,200);
  fruta1=new Fruta(100,100);
  enemigo1=new Enemigo(random(20, width-20), random(20, height-20), 200, (int)random(1, 3));
  jugador=new Jugador(width/2,height/2, 200);
}

public void draw() {
  switch (estado) {
  case 1:  //Pantalla de inicio del juego
    fondo.display();
    if (keyCode==ENTER) {
      estado=StateMachine.JUGANDO;
    }
    break;

  case 2:  //Jugar primer nivel
    fondo.display();
  
    //pruebas de dibujo
    fondo.display();
    agua1.display();
    fruta1.display();
    enemigo1.display();
    jugador.display();
    break;

  case 3:
    break;

  case 4:
    break;
  }
}


//Inputs de movimiento del jugador
public void keyPressed() {
  jugador.readCommand();
}

public void keyReleased() {
  if (keyCode==UP) {
    jugador.setUpPressed(false);
    jugador.setEstado(StateJugador.IDLE);
  }
  if (keyCode==DOWN) {
    jugador.setDownPressed(false);
    jugador.setEstado(StateJugador.IDLE);
  }
  if (keyCode==RIGHT) {
    jugador.setRightPressed(false);
    jugador.setEstado(StateJugador.IDLE);
  }
  if (keyCode==LEFT) {
    jugador.setLeftPressed(false);
    jugador.setEstado(StateJugador.IDLE);
  }
}
