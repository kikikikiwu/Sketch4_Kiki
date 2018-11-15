class Element{
  float x, y;
  float r = random(0.1,5);
  float alpha = random(0,20);
  color col = color(200,50,80);
  boolean isDisplayed = false;
  
    Element(float x_, float y_){
      x = x_;
      y = y_;
    }
    
    void display(){
      noStroke();
      fill(col, alpha);
      ellipse(x, y, r, r);
    }
}
