//Uso de la biblioteca minim para usar audio
import ddf.minim.*;

private Minim minim;
//variables de audio
private AudioPlayer comenzarJuego;
private AudioPlayer victoria;

//Objetos y listas de objetos
private Jugador jugador;
private ArrayList<Enemigo> enemigos;
private ArrayList<Fruta> frutas;

private Fondo fondo;
//Variable para la maquina de estados
private int estado;
//Variable para la fuente de texto
private PFont font;

public void setup() {
  size(600, 600);
  background(0);
  
  minim = new Minim(this);
  //carga de los archivos de audio
  comenzarJuego = minim.loadFile("comenzarJuego.wav");
  victoria = minim.loadFile("victoria.wav");
  
  //Se establece la fuente del texto
  font=createFont("bahnschrift.ttf", 20);
  textFont(font);
  
  fondo=new Fondo();
  enemigos=new ArrayList<Enemigo>();
  //dibuja aleatoreamente 6 enemigos
    for(int i=0;i<6;i++){
      enemigos.add(new Enemigo(random(20, width-20), random(20, height-20), 200, (int)random(1, 3)));
    }
  frutas=new ArrayList<Fruta>();
  //añade las frutas dentro del arryList
  //dibuja aleatoriamente 12 frutas
  for(int j=0;j<6;j++){
    frutas.add(new Zanahoria(random(20, width-20), random(20, height-20)));
    frutas.add(new Remolacha(random(20, width-20), random(20, height-20)));
  }
  //Se establece el stateMachine en 1 para mostrar la pantalla de inicio
  estado=StateMachine.INICIO;
  
  jugador=new Jugador(width/2, height/2, 200);
}

public void draw() {
  switch (estado) {
  case 1:  //Pantalla de inicio del juego
    fondo.display();
    if (keyCode==ENTER) {
      comenzarJuego.rewind();//se reproduce un sonido al empezar el juego
      comenzarJuego.play();
      estado=StateMachine.JUGANDO;
    }
    break;

  case 2:  //Jugar primer nivel
    fondo.display();
   //da un efecto de seguimiento de camara hacia los lados
    fondo.seguirMovimiento(jugador);
    
    jugador.display();
    //aplica el polimorfismo y dibuja las frutas, también se controla la colision con el jugador
    //no se usa 'for (Fruta frutita : fruta)' ya que dará error al momento de actualizar el tamaño de la lista al comer una fruta

    for (int x=0; x<frutas.size(); x++) {
      Fruta frutita = frutas.get(x);
      frutita.display();
      jugador.comer(frutita);
    }

    //muestra de los enemigos
   for (int y=0; y<enemigos.size(); y++) {
     Enemigo eni = enemigos.get(y);
      eni.display();
      eni.atacaJugador(jugador);
      
      //control de colisión de todas las agua que estén en pantalla
      for(Agua awa : jugador.getAgua()){
         awa.destruyeEnemigo(eni);
      }
    }
    //muestra de la cantidad de enemigos y frutas
    stroke(#ffffff);
    strokeWeight(10);
    text("Enemigos restantes: "+enemigos.size(),20,30);
    text("Frutas restantes: "+frutas.size(),20,50);
    break;

  case 3:
    fondo.display();
    if (keyCode==ENTER) {
      comenzarJuego.rewind();//se reproduce un sonido al empezar el juego
      comenzarJuego.play();
      estado=StateMachine.JUGANDO;
    }
    break;

  case 4:
    victoria.play();//se reproduce audio al completar el nivel
    fondo.display();
    break;
  }
  
  
  //condiciones para ganar el nivel: comer todas las frutas y eliminar todos los enemigos
  if(frutas.size()<=0 && enemigos.size()<=0){
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
    return frutas;
  }  
public void setListaFruta(ArrayList<Fruta> frutas){
  this.frutas=frutas;
}  
  
 public ArrayList<Enemigo> getListaEnemigo() {
   return enemigos;
 }
 public void setListaEnemigo(ArrayList<Enemigo> enemigos){
   this.enemigos=enemigos;
 }
 
public int getEstado(){
  return this.estado;
}
