int numFloors = 7; //Total floors
int numElevators = 1; //Total elevators
int elevatorStartFloor = 2; //Elevator starts here
Floor[] floors = new Floor[numFloors];
Elevator[] elevators = new Elevator[numElevators];

int floorHt = 110; //pixel height of each floor
int elevatorHt = 80; //pixel height of elevator
int scale = 1; //allows us to scale everything

int mainLine; //pixels from the left to draw floors
int groundFloor; //pixels from bottom to draw ground

Dot d = new Dot(); //TEST

/* Run once at program start */
void setup() {
  size(840, 900);
  mainLine = width/2; //must call width after size()
  groundFloor = height - floorHt; //must call height after size()
  CreateFloors(floors, numFloors, floorHt, elevatorHt);
  CreateElevators(elevators, numElevators, elevatorHt);
  
}


/* Run every frame */
void draw() {
  background(50);
  DisplayGround(groundFloor);
  DisplayFloors(floors);
  DisplayElevator(elevators);

  UpdateElevators(elevators);
  d.Show();//TEST
  d.Update();//TEST
}


void UpdateElevators(Elevator[] elevators) {
  for (Elevator e : elevators) {
    e.Update();
    e.Log();
  }
}


void mouseReleased() {
  for (Floor floor : floors) {
    if (floor.panel.IsPressed(mouseX, mouseY)) {
      HashMap<String, Integer> hm = new HashMap<String, Integer>();
      hm.put("floor", floor.number);
      hm.put("estop", floor.elevatorStop);

      floor.panel.CallElevator(hm);
      break;
    }
  }
}


void mouseClicked() {
  //println("x: " + mouseX + " y: " + mouseY);
}


void CreateElevators(Elevator[] elevators, int numElevators, int elevatorHt) {
  PVector loc;

  try {
    for (int i = 0; i < numElevators; i++) {
      int start = floors[elevatorStartFloor].elevatorStop;

      loc = new PVector(mainLine, start);

      elevators[i] =new Elevator("Ross", elevatorHt, loc, elevatorStartFloor );
    }
  }
  catch(Error e) {
    println("Error: " + e);
  }
}


void DisplayElevator(Elevator[] elevators) {
  for (Elevator e : elevators) {
    e.Display();
  }
}


void CreateFloors(Floor[] floors, int numFloors, int floorHt, int elevatorHt) {
  PVector loc;
  Floor f;
  int estop = floorHt - elevatorHt;

  for (int floorNum = numFloors - 1; floorNum >= 0; floorNum--) {
    loc = new PVector(mainLine, groundFloor - (floorNum * floorHt) - floorHt);

    //If this is the top floor, dont make an UP button
    f = new Floor(floorNum, floorHt, loc, elevators, estop);

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


void DisplayFloors(Floor[] floors) {
  for (Floor f : floors) {
    f.Display();
  }
}


void DisplayGround(int groundLevel) {
  stroke(255);
  line(0, groundLevel, width, groundLevel);
}
