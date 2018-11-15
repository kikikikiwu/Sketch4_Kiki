class DroppingText {
  PVector location, velocity, gravity;
  String line;
  PFont f;
  float s = 40, a;
  
  DroppingText(float x_, float y_, String line_, PFont f_) {
    location = new PVector(x_,y_);
    velocity = new PVector(0, 5);
    gravity = new PVector(0, 1);
    line = line_;
    f = f_;
    a = 2;
  }
  
  void drop() {
    if (location.y > height) {
      return;
    }
    velocity.add(gravity);
    location.add(velocity);
  }
  
  void display() {
    textFont(f);
    s = s - a;
    if ( s <= 0){
      s = 0;
      return;
    }
    textSize(s);
    fill(0,120,70);
    println(s);
    text(line, location.x, location.y);
  }
}
