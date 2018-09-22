
class Elevator {
  String id; // Name
  int xpos;
  int ypos;
  int capacity; // Max number of Rider
  int speed = 0;
  int height; // Height of this floor
  int width; // Width of this floor

  Elevator(Integer id, int height, int xpos, int ypos) {
    this.height = height;
    this.width = height;
    this.id = "Cart " + id.toString();
    this.xpos = xpos;
    this.ypos = ypos;
  }

  public void Move(int mousey) {
    this.ypos += this.speed;
    //translate(0, 20);
    //Display();
  }

  private void Activate() {
    this.speed = 10;
  }

  public void Deactivate() {
    this.speed = 0;
  }

  // Let's draw this floor
  public void Display() {
    fill(225);
    stroke(0);
    rect(xpos - width, ypos, width, height);
  }

  public void Log() {
    println(id + ", Height: " + height + ", xpos: " + xpos + ", ypos: " + ypos);
  }
}
