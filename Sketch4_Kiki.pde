PFont f;
PGraphics pg;
color c_ = color(0);

ArrayList<Element> elms = new ArrayList <Element>();
Element e;

void setup(){
  size(800,800);
  background(255);
  
  f = createFont("ArmWrestler.ttf", 100);
  
  //merge text and background as a new image
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(255);
  pg.fill(c_);
  pg.textFont(f);
  pg.textAlign(CENTER);
  pg.text("Married", width/2, height/2 - 100);
  pg.text("with Children", width/2, height/2 + 100);
  pg.endDraw();
  //image(pg, width/2, height/2); 

 //store the location for elements
 if (elms.size() < 1000){
  for (int x = 0; x < width; x+=4){
    for (int y = 0; y < height; y+=4){
      color c = pg.get(x,y);
        if(c <= c_){
        elms.add(new Element (x, y));
        }
      }
    }
 }
}

void draw(){
  int eAmount = 100; //display amount at once
  for (Element e: elms){
    if (e.isDisplayed) {
      e.display();
    }
    if (!e.isDisplayed && frameCount % 5 == 0) { //update at customized frameRate
      e.isDisplayed = true;
      eAmount --;
    }
    if (eAmount == 0){
      return;
    }
  }
}
