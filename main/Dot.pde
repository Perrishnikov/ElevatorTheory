public class Dot {
  int posx = 40;
  int posy = height/2;
  int speed = 5;


  Dot() {
  }

  private void Show() {
    //println("posy: " + posy);
    fill(225);
    ellipse(posx, posy, 80, 80);
    
    fill(225, 0, 0);
    rect(posx + 100, posy + 100, 80, 80);
  }

  private void Update() {
    //this.posx += this.speed;
    if(this.posy >= height || this.posy <= 0){
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
