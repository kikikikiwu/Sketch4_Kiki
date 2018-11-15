class DroppingText {
  PVector location, velocity, gravity;
  //float verticalVelocity = 2.1;
  //float gravity = 0.2;
  float x, y;
  String line;
  PFont f;
  
  DroppingText(float x_, float y_, String line_, PFont f_) {
    location = new PVector(x_,y_);
    velocity = new PVector(0, 2);
    gravity = new PVector(0, 0.2);
    line = line_;
    f = f_;
  }
  
  void drop() {
    if (location.y > height) {
      return;
    }
    // Add velocity to the location.
    //y += verticalVelocity;
    velocity.add(gravity);
    location.add(velocity);
    // Add gravity to velocity
    //verticalVelocity += gravity;
  }
  
  void display() {
    textFont(f);
    fill(0,120,70);
    println(1);
    text(line, location.x, location.y);
  }
}
