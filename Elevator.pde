
class Elevator {
  //Static Fields 
  int high; // Height of this elevator
  int wide; // Width of this elevator

  String name; // Name
  PVector loc; // x and y of elevator
  int currentFloor;

  int capacity; // Max number of Rider
  float maxSpeed = 4;
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


  /*
    Checks to see if the next floor in queue is up or down and 
    sets this.direction to "-1" for up, and "1" for down
    Called from here in Update()
   */
  void setDirection() {

    if (floorQueue.get(0).get("floor") > currentFloor) {
      this.direction = -1;
    } else {
      this.direction = 1;
    }
  }


  /*
   Check to see if the elevator is at floor's elevator stop.
   Used here in elevator.update()
   */
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
   Used to add a request to the end of the floor queue
   Called from panel.CallElevator()
   Rule: 
     Dont add a floor if its the same one as its stopped on
   */
  void QueueAdd(HashMap<String, Integer> destination) {

    if (!IsSameFloor(destination.get("floor"), currentFloor )) {
      this.floorQueue.add(destination);
      println("In Elevator QueueAdd()");
      printArray(floorQueue);
    }
  }


  /*
   Used to determine if the call for the elevator is made from the same floor its on.
   If so, dont add it to the queue.
   Called from here in QueueAdd()
   */
  boolean IsSameFloor(int destFloor, int curFloor) {
    if (destFloor == curFloor) {
      return true;
    } else {
      return false;
    }
  }


  /*
   Let's draw this floor
   Called from Main draw()
   */
  void Display() {
    fill(225);
    stroke(0);
    rect(loc.x - wide, loc.y, wide, high);
  }


  void Log() {
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
