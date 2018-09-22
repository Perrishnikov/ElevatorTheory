class Panel {
  //https://www.compart.com/en/unicode/html
  char upChar = '\u21E7'; //up arrow
  int upfill = 120; //color of up section
  boolean upIsPressed = false;
  float upXpos;
  float upYpos;

  int buttonSize = 20;
  ArrayList<Elevator> elevators = new ArrayList<Elevator>();
  int number; //Floor number
  String isPressedFill = "red";
  float midFloorHt; //Y pos of the middle of the floor. For Panel
  boolean isTopFloor = false;
  boolean isBottomFloor = false;

  char dnChar = '\u21E9'; //down arrow
  int dnfill = 150;
  boolean dnIsPressed = false;
  float dnXpos;
  float dnYpos;

  Panel(int number, int ht, PVector loc, ArrayList<Elevator> elevators) {
    this.number = number;
    this.midFloorHt = loc.y - (ht /2);
    this.upXpos = loc.x;
    this.upYpos = loc.y;

    this.dnXpos = loc.x;
    this.dnYpos = loc.y + buttonSize;
    this.elevators = elevators;
  }

  void SetTopFloor() {
    this.isTopFloor = true;
  }

  void SetBottomFloor() {
    this.isBottomFloor = true;
  }


  /*
  Checks to see if the mouse click was on a up or down button
   Called in main.mouseReleased()
   */
  boolean IsPressed(int mousex, int mousey) {
    if ((mousex >= upXpos && mousex < (upXpos + buttonSize))  
      && (mousey >= upYpos && mousey < upYpos + buttonSize )) {
      println("Hit up on " + number);
      return true;
    } else if ((mousex >= dnXpos && mousex < (dnXpos + buttonSize))  
      && (mousey >= dnYpos && mousey < dnYpos + buttonSize )) {
      println("Hit down on " + number);
      return true;
    } else {
      return false;
    }
  }


  /*
  Called by main. Tells elevator to add this floor to its queue
   */
  void CallElevator(int destination) {
    //elevator needs to know where to go. up or down
    elevators.get(0).QueueAdd(destination);
    //elevators.get(0).Move();
  }


  void Display() {
    //UP button and arrow
    if (!isTopFloor) {
      fill(upfill);
      stroke(1);
      rect(upXpos, upYpos, buttonSize, buttonSize);

      fill(0);
      textSize(20);
      text(upChar, upXpos + (buttonSize /5), upYpos + buttonSize -2 );
    }

    //DOWN button and arrow
    if (!isBottomFloor) {
      fill(dnfill);
      stroke(1);
      rect(dnXpos, dnYpos, buttonSize, buttonSize);

      fill(0);
      textSize(20);
      text(dnChar, dnXpos + (buttonSize /5), dnYpos + buttonSize -2);
    }
  }

  void Log() {
    println("Floor: " + number + " upXpos: " + upXpos + ", upYpos: " + upYpos + ", dnXpos: " + dnXpos + ", dnYpos: " + dnYpos);
  }
}
