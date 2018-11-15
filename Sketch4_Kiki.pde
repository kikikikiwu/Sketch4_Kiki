PFont f;
PGraphics pg;
color c_ = color(0);

ArrayList<Element> elms = new ArrayList <Element>();
Element e;

void setup(){
  size(800,800);
  
  f = createFont("Caviar_Dreams_Bold.ttf", 400);
  
  //create another image with the text
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(255);
  pg.fill(c_);
  pg.textFont(f);
  pg.textAlign(CENTER);
  pg.text("M", width/2, height/2);
  pg.endDraw();
  //image(pg, width/2, height/2); 
  
}

void draw(){
  for (int x = 0; x < width; x+=10){
    for (int y = 0; y < height; y+=10){
      color c = pg.get(x,y);
      if(c <= c_){
        elms.add(new Element (x, y));
      }
    }
  }
  for (Element e: elms){
  e.display();
  }
}
