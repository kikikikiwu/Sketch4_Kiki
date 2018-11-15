PFont f1, f2;
PGraphics pg;
PImage oasis;
color c_ = color(0);
boolean typed = false;
int lineNum = 0;
float r;

String[] lines;
ArrayList<Element> elms = new ArrayList <Element>();
Element e;
ArrayList<DroppingText> droppingTexts = new ArrayList<DroppingText>();


void setup(){
  size(800,800);
  background(255);
  
  f1 = createFont("Monoton-Regular.ttf", 100);
  f2 = createFont("CaviarDreams.ttf", 20);
  oasis = loadImage("Oasis_AlbumSQ.jpg");
  lines = loadStrings("MarriedwithChildren.txt");
  
  //merge text and background as a new image
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(255);
  pg.fill(c_);
  pg.textFont(f1);
  pg.textAlign(CENTER);
  pg.text("Married", width/2, height/2 - 100);
  pg.text("with", width/2, height/2);
  pg.text("Children", width/2, height/2 + 100);
  pg.endDraw();
  //image(pg, width/2, height/2); 

 //store the location for elements
 if (elms.size() < 2000){
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
//song's name
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
  for (DroppingText droppingText : droppingTexts) {
    droppingText.drop();
    droppingText.display();
  }
}

void mouseClicked(){
  //dropping lyric
  droppingTexts.add(new DroppingText(mouseX, mouseY, lines[lineNum], f2));
  
  //update line index
  lineNum ++;
  textFont(f2);
  fill(0,120,70);
  text(lines[lineNum], mouseX, mouseY);
  
  if(lineNum > lines.length){
    lineNum = 0;
  }
}
