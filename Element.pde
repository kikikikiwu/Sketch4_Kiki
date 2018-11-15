class Element{
  float x, y, px, py;
  float r = random(0.1,10);
  float alpha = random(10,30);
  color o;
  boolean isDisplayed = false;
  
    Element(float x_, float y_){
      x = x_;
      y = y_;
      px = random(oasis.width);
      py = random(oasis.height);
      o = oasis.get((int)x, (int)y);
    }
    
    void display(){
      stroke(o);
      strokeWeight(random(0.5,3));
      noFill();
      rect(x, y, r, r);
      
      stroke(o, alpha);
      strokeWeight(random(0.5, 10));
      fill(o, alpha);
      ellipse(px, py, 3*r, 3*r);
    }
}
