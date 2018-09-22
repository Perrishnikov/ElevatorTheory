class Floor {
  int number; // Floor Number (Ground == 0)
  int high; // Height of this floor
  int wide = 200; // Width of this floor 
  int fillColor = 255;
  int strokeColor = 0;
  Panel panel;
  PVector loc; //this floors x and y
  float elevatorStop; //the y height that the elevator needs to stop at to be even with floor

  Floor(int number, int high, PVector loc, ArrayList<Elevator> elevators, int estop) {
    this.number = number;
    this.high = high;
    this.loc = loc;
    this.elevatorStop = loc.y - estop;
    this.panel = new Panel(number, high, loc, elevators);
  }

  // Let's draw this floor
  void Display() {
    fill(this.fillColor);
    stroke(strokeColor);
    rect(loc.x, loc.y, this.wide, this.high);
    DisplayNumber();
    panel.Display();
  }

  //Let's draw this floor number
  void DisplayNumber() {
    float xposN = loc.x + wide;
    float yposN = loc.y + (high /2);
    int size = wide / 4;
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
    println("Floor #" + number + ", Height: " + high + ", xpos: " + loc.x + ", ypos: " + loc.y);
  }
}
