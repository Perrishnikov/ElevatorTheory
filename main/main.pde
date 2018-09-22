int numFloors = 5; //Total floors
int numElevators = 1; //Total elevators
ArrayList<Floor> floors = new ArrayList<Floor>();
ArrayList<Elevator> elevators = new ArrayList<Elevator>();

int mainLine; //pixels from the left to draw floors
int floorHt = 50; //pixel height of each floor
int groundFloor; //pixels from bottom to draw ground

Dot d;

/* Run once at program start */
void setup() {
  //background(50);
  size(640, 640);
  //mainLine = width/2; //must call width after size()
  //groundFloor = height - floorHt; //must call height after siz()
   d = new Dot();

  frameRate(30);
  //d.Show();
}




/* Run every frame */
void draw() {
  background(50);
  d.Show();
  //DisplayGround(groundFloor);
  //CreateFloors(floors, numFloors, floorHt);
  //DisplayFloors(floors);
  //CreateElevators(elevators, numElevators, floorHt);
  //DisplayElevator(elevators);
  //println("ho");
  //int draw = 0;
  d.Update();
  //ellipse(mouseX, mouseY, 80, 80);
  //for (Elevator e : elevators) {
  //  e.Move(mouseY);
  //}
  //int p = 0;
  //line(0, p, width, height);
  //p++;
  //println(frameRate);
}

void mouseReleased() {

  //for (Floor f : floors) {
  //  //println("floor: " +f.number);
  //  if (f.panel.CheckIfPressed(mouseX, mouseY)) {
  //    //println("break on " + f.number);
  //    f.panel.CallElevator(f.ypos);
  //    break;
  //  }
  //}
}

void mouseClicked() {
  println("x: " + mouseX + " y: " + mouseY);
}

void CreateElevators(ArrayList<Elevator> elevators, int numElevators, int floorHt) {
  int xpos;
  int ypos;

  for (Integer id = 1; id <= numElevators; id++) {
    xpos = mainLine;
    ypos = groundFloor - (1 * floorHt);

    elevators.add(new Elevator(id, floorHt, xpos, ypos));
  }
}


void DisplayElevator(ArrayList<Elevator> elevators) {
  for (Elevator e : elevators) {
    e.Display();
    //e.Log();
  }
}


void CreateFloors(ArrayList<Floor> floors, int numFloors, int floorHt) {
  int xpos;
  int ypos;
  Floor f;

  for (int floorNum = numFloors - 1; floorNum >= 0; floorNum--) {
    xpos = mainLine;
    ypos = groundFloor - (floorNum * floorHt) - floorHt;

    //If this is the top floor, dont make an UP button
    f = new Floor(floorNum, floorHt, xpos, ypos, elevators);
    if (floorNum == 0) {
      f.panel.SetBottomFloor();
    }

    //If this is the bottom floor, dont make an DN button
    if (floorNum == numFloors - 1) {
      f.panel.SetTopFloor();
    }

    floors.add(f);
  }
}


void DisplayFloors(ArrayList<Floor> floors) {
  for (Floor f : floors) {
    f.Display();
    //f.Log();
  }
}


void DisplayGround(int groundLevel) {
  stroke(255);
  line(0, groundLevel, width, groundLevel);
}
