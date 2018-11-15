class Element{
  float x, y;
  float r = random(0.1,5);
  float alpha = random(0,10);
  color o;
  boolean isDisplayed = false;
  
    Element(float x_, float y_){
      x = x_;
      y = y_;
    }
    
    void display(){
     float px = random(oasis.width);
     float py = random(oasis.height);
     o = oasis.get((int)x, (int)y);
      noStroke();
      fill(o);
      ellipse(x, y, r, r);
      fill(0, alpha);
      ellipse(px, py, 2*r, 2*r);
    }
}
