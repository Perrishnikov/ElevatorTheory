public class Panel {
  //https://www.compart.com/en/unicode/html
  char upChar = '\u21E7'; //up arrow
  int upfill = 120; //color of up section
  boolean upIsPressed = false;
  int upXpos;
  int upYpos;

  int buttonSize = 20;
  ArrayList<Elevator> elevators = new ArrayList<Elevator>();
  int number; //Floor number
  String isPressedFill = "red";
  int midFloorHt; //Y pos of the middle of the floor. For Panel
  private boolean isTopFloor = false;
  private boolean isBottomFloor = false;

  char dnChar = '\u21E9'; //down arrow
  int dnfill = 150;
  boolean dnIsPressed = false;
  int dnXpos;
  int dnYpos;

  Panel(int number, int ht, int xpos, int ypos, ArrayList<Elevator> elevators) {
    this.number = number;
    this.midFloorHt = ypos - (ht /2);
    this.upXpos = xpos;
    //println("ht: " + ht + " ypos: " + ypos);
    this.upYpos = ypos;

    this.dnXpos = xpos;
    this.dnYpos = ypos + buttonSize;
    this.elevators = elevators;
  }

  public void SetTopFloor() {
    this.isTopFloor = true;
  }

  public void SetBottomFloor() {
    this.isBottomFloor = true;
  }

  public boolean CheckIfPressed(int mousex, int mousey) {

    // I prolly want to return a floor or null...

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

  void CallElevator(int mousey) {
    elevators.get(0).Move(mousey);
    elevators.get(0).Activate();
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

  public void Log() {
    println("Floor: " + number + " upXpos: " + upXpos + ", upYpos: " + upYpos + ", dnXpos: " + dnXpos + ", dnYpos: " + dnYpos);
  }
}
