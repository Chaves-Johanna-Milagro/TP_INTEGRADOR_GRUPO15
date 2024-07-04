//clase utilizada para aplicar el polimorfismo
abstract class Fruta {
  protected Collider collider;

  abstract void display();

  public Collider getCollider() {
    return this.collider;
  }
}
