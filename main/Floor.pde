class Floor {
  private int number; // Floor Number (Ground == 0)
  int ht; // Height of this floor
  int width = 200; // Width of this floor 
  int xpos; // Left side of floor
  int ypos; //Top side of floor 
  ArrayList riders = new ArrayList<Rider>();
  private int fillColor = 255;
  int strokeColor = 0;
  //ArrayList<Elevator> elevators = new ArrayList<Elevator>();
  public Panel panel;

  Floor(int number, int ht, int xpos, int ypos, ArrayList<Elevator> elevators) {
    this.number = number;
    this.ht = ht;
    this.xpos = xpos;
    this.ypos = ypos;
    this.panel = new Panel(number, this.ht, xpos, ypos, elevators);
  }

  private Rider CreateRider() {
    return new Rider();
  }
  
  // Let's draw this floor
  void Display() {
    fill(this.fillColor);
    stroke(strokeColor);
    rect(xpos, ypos, this.width, this.ht);
    DisplayNumber();
    panel.Display();
    //DisplayControlPanel();
  }

  //Let's draw this floor number
  private void DisplayNumber() {
    int xposN = xpos + this.width;
    int yposN = ypos + (this.ht /2);
    int size = width / 4;
    int textSize = 32;

    //Make an ellipse
    fill(255);
    stroke(0);
    ellipse(xposN, yposN, size, size);

    //Make the text
    fill(0);
    textSize(textSize);
    text(number, xposN - (textSize/4), yposN + (textSize /3));
  }

  void Log() {
    println("Floor #" + number + ", Height: " + height + ", xpos: " + xpos + ", ypos: " + ypos);
  }
}
