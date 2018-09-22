
class Elevator {
  //Static Fields 
  PVector loc; // x and y of elevator
  int high; // Height of this elevator
  int wide; // Width of this elevator

  String name; // Name
  int capacity; // Max number of Rider
  int maxSpeed = 10;
  int currentSpeed = 0;
  int acceleration = 10;

  int currentFloor;
  IntList floorQueue = new IntList(); 

  Elevator(String name, int high, PVector loc) {
    this.high = high;
    this.wide = 40;
    this.name = name;
    this.loc = loc;
  }

  void Update() {
    //this.posx += this.speed;
    //if(this.ypos >= height || this.ypos <= 0){
    //this.speed *= -1; 
    //}
    //this.ypos += this.speed;
  }

  void Move(int mousey) {
    //this.ypos += this.speed;
    //translate(0, 20);
    //Display();
  }

  void QueueAdd(int destination) {
    this.floorQueue.append(destination);
    printArray(floorQueue);
    //add force. What direction will it head?
    //if up *-1 , if down *1
    //this.acceleration *= -1;
  }

  // Let's draw this floor
  void Display() {
    fill(225);
    stroke(0);
    //rect(xpos - width, ypos, width, height);
    rect(loc.x - wide, loc.y, wide, high);
  }

  void Log() {
    println(name + ", Height: " + height + ", xpos: " + loc.x + ", ypos: " + loc.y);
  }
}
