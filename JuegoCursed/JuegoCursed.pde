//Objetos y listas de objetos
private Jugador jugador;
private ArrayList<Enemigo> enemigo;
private ArrayList<Fruta> fruta;

private Fondo fondo;
//Variable para la maquina de estados
private int estado;

public void setup() {
  size(600, 600);
  background(0);

  fondo=new Fondo();
  enemigo=new ArrayList<Enemigo>();

  fruta=new ArrayList<Fruta>();
  //añade las frutas dentro del arryList
  fruta.add(new Zanahoria(200, 200));
  fruta.add(new Remolacha(400, 400));

  //Se establece el stateMachine en 1 para mostrar la pantalla de inicio
  estado=StateMachine.INICIO;

  //pruebas de animacion
  enemigo.add(new Enemigo(random(20, width-20), random(20, height-20), 200, (int)random(1, 3)));
  jugador=new Jugador(width/2, height/2, 200);
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

    jugador.display();

    //aplica el polimorfismo y dibuja las frutas, también se controla la colision con el jugador
    //no se usa 'for (Fruta frutita : fruta)' ya que dará error al momento de actualizar el tamaño de la lista al comer una fruta

    for (int x=0; x<fruta.size(); x++) {
      Fruta frutita = fruta.get(x);
      frutita.display();
      jugador.comer(frutita);
    }

    //muestra de los enemigos
    for (Enemigo eni : enemigo) {
      eni.display();
      eni.atacaJugador(jugador);
    }
    break;

  case 3:
    fondo.display();
    if (keyCode==ENTER) {
      estado=StateMachine.JUGANDO;
    }
    break;

  case 4:
    println("GANASTE!");
    break;
  }
  
  
  //condiciones para ganar el nivel
  if(fruta.size()==0){
    estado=StateMachine.GANADO;
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


public ArrayList<Fruta> getListaFruta() {
    return fruta;
  }
