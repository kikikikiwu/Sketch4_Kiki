class Element{
  float x, y;
  float size = random(1,10);
  color col = color(200,50,80);
  
    Element(float x_, float y_){
      x = x_;
      y = y_;
    }
    
    void display(){
      noStroke();
      fill(col, 20);
      ellipse(x, y, size, size);
    }
}
