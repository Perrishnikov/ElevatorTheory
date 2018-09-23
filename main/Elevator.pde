
class Elevator {
  //Static Fields 
  int high; // Height of this elevator
  int wide; // Width of this elevator

  String name; // Name
  PVector loc; // x and y of elevator
  int currentFloor;

  int capacity; // Max number of Rider
  float maxSpeed = 5;
  PVector speed = new PVector(0, 0); //accumulated by adding acceleration every update
  PVector acceleration = new PVector(0, .1);
  int direction = 0;

  ArrayList<HashMap<String, Integer>> floorQueue = new ArrayList<HashMap<String, Integer>>(); 

  Elevator(String name, int high, PVector loc, int elevatorStartFloor) {
    this.high = high;
    this.wide = 40;
    this.name = name;
    this.loc = loc;
    this.currentFloor = elevatorStartFloor;
  }


  /*
   Called by main in draw()
   */
  void Update() {

    Log();

    //If there is a number in the list...
    if (floorQueue.size() > 0) {

      setDirection();
      PVector move = speed.add(PVector.mult(acceleration, direction));
      int estop = floorQueue.get(0).get("estop");
      speed.limit(maxSpeed);
      loc.add(move);

      if (IsArrived(estop)) {
        this.speed = new PVector(0, 0);
        this.currentFloor = floorQueue.get(0).get("floor");
        this.floorQueue.remove(0);
      }
    }
  }


  void setDirection() {

    if (floorQueue.get(0).get("floor") > currentFloor) {
      this.direction = -1;
    } else {
      this.direction = 1;
    }
  }


  boolean IsArrived(int estop) {

    if (direction == 1) {
      if (estop <= loc.y) {
        return true;
      }
      return false;
    } else {
      if (estop >= loc.y) {
        return true;
      }
      return false;
    }
  }


  /* 
   Called from panel.CallElevator()
   */
  void QueueAdd(HashMap<String, Integer> destination) {

    if (!IsSameFloor(destination.get("floor"), currentFloor )) {
      this.floorQueue.add(destination);
      println("In Elevator QueueAdd()");
      printArray(floorQueue);
    }
  }

  boolean IsSameFloor(int destFloor, int curFloor) {
    if (destFloor == curFloor) {
      return true;
    } else {
      return false;
    }
  }

  // Let's draw this floor
  void Display() {
    fill(225);
    stroke(0);
    rect(loc.x - wide, loc.y, wide, high);
  }

  void Log() {
    //println(name + ", Height: " + height + ", xpos: " + loc.x + ", ypos: " + loc.y);
    //text(", 10, height -240);
    text("direction: " + direction, 10, height -240);
    text("currentFloor: " + currentFloor, 10, height -210);
    text("accel: " + acceleration.y, 10, height -180);
    text("maxVelocity: " + maxSpeed + " speed: " + speed.y, 10, height -150);
    text("floorQueue size: " + floorQueue.size(), 10, height -90);

    fill(150);
    for (int i = 0; i < floorQueue.size(); i++) {
      text("floor: " + floorQueue.get(i).get("floor"), (i * 160) + 10, height - 60);
      text("estop: " + floorQueue.get(i).get("estop"), (i * 160) + 10, height - 30);
    }
  }
}
