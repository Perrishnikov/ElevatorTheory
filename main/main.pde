int numFloors = 5; //Total floors
int numElevators = 1; //Total elevators
int elevatorStartFloor = 0; //Elevator starts here
Floor[] floors = new Floor[numFloors];
Elevator[] elevators = new Elevator[numElevators];

int floorHt = 120; //pixel height of each floor
int elevatorHt = 80; //pixel height of elevator
int scale = 1; //allows us to scale everything

int mainLine; //pixels from the left to draw floors
int groundFloor; //pixels from bottom to draw ground

Dot d = new Dot(); //TEST

/* Run once at program start */
void setup() {
  size(640, 800);
  mainLine = width/2; //must call width after size()
  groundFloor = height - floorHt; //must call height after size()
  CreateFloors(floors, numFloors, floorHt);
  CreateElevators(elevators, numElevators, elevatorHt);
  frameRate(60);
}


/* Run every frame */
void draw() {
  background(50);
  DisplayGround(groundFloor);
  DisplayFloors(floors);
  DisplayElevator(elevators);

  d.Show();
  d.Update();


  for (Elevator e : elevators) {
    //e.Move();
    //e.Log();
  }
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

  for (Floor floor : floors) {
    if (floor.panel.IsPressed(mouseX, mouseY)) {
      //println("break on " + f.number);
      floor.panel.CallElevator(floor.number);
      break;
    }
  }
}

void mouseClicked() {
  //println("x: " + mouseX + " y: " + mouseY);
}

void CreateElevators(ArrayList<Elevator> elevators, int numElevators, int elevatorHt) {
  PVector loc;

  for (int i = 1; i <= numElevators; i++) {
    Floor floor = floors.get(elevatorStartFloor);
    //float startLoc = floor.elevatorStop;
    loc = new PVector(mainLine, groundFloor - floorHt);

    elevators.add(new Elevator("Ross", elevatorHt, loc));
  }
}


void DisplayElevator(ArrayList<Elevator> elevators) {
  for (Elevator e : elevators) {
    e.Display();
    //e.Log();
  }
}


void CreateFloors(Floor[] floors, int numFloors, int floorHt) {
  int xpos;
  int ypos;
  PVector loc;
  Floor f;

  for (int floorNum = numFloors - 1; floorNum >= 0; floorNum--) {
    loc = new PVector(mainLine, groundFloor - (floorNum * floorHt) - floorHt);
    //xpos = mainLine;
    //ypos = groundFloor - (floorNum * floorHt) - floorHt;

    //If this is the top floor, dont make an UP button
    f = new Floor(floorNum, floorHt, loc, elevators, floorHt - elevatorHt);
    
    if (floorNum == 0) {
      f.panel.SetBottomFloor();
    }

    //If this is the bottom floor, dont make an DN button
    if (floorNum == numFloors - 1) {
      f.panel.SetTopFloor();
    }

    floors[floorNum] = f;
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
