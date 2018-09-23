class Dot {
  int posx = 40;
  int posy = height/2;
  int speed = 5;
  PVector v1 = new PVector(0, 0);
  PVector v;
  Dot() {
  }

  private void Show() {
    
    //println("posy: " + posy);
    fill(225);
    stroke(0);
    ellipse(posx, posy, 80, 80);
    //rect(v1.x, v1.y, 100, 100);
    fill(225, 0, 0);
    stroke(0);
    //rect(150, 150, 4, 4);
    
    
    v = new PVector(10, 10, 0);
    ellipse(v.x, v.y, 12, 12);
    v.mult(10);
    ellipse(v.x, v.y, 24, 24);


    //translate(100, 100);
    //rect(v1.x + 200, v1.y + 200, 100, 100);



    //fill(225, 0, 0);
    //rect(posx + 100, posy + 100, 80, 80);
  }

  private void Update() {
    //this.posx += this.speed;
    if (this.posy >= height || this.posy <= 0) {
      this.speed *= -1;
    }
    this.posy += this.speed;
    //translate(10, 10);
    //fill(225, 0, 0);
    //translate(width/2, height/2);
    //rotate(PI/3.0);
    //fill(225, 0, 0);
    //rect(posx + 100, posy + 100, 80, 80);
    //rect(-26, -26, 52, 52);
  }
}
