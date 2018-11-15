PFont f1, f2;
PGraphics pg;
PImage oasis;
color c_ = color(0);
int lineNum;

String[] lines;
ArrayList<Element> elms = new ArrayList <Element>();
ArrayList<DroppingText> droppingTexts = new ArrayList<DroppingText>();


void setup(){
  size(800,800);
  background(255);
  
  f1 = createFont("BowlbyOneSC-Regular.ttf", 180);
  f2 = createFont("CaviarDreams.ttf", 40);
  oasis = loadImage("Oasis_AlbumSQ.jpg");
  lines = loadStrings("MarriedwithChildren.txt");
  
  //merge text and background as a new image
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(255);
  pg.fill(c_);
  pg.textFont(f1);
  pg.textAlign(CENTER);
  pg.text("Married", width/2, height/2 - 180);
  pg.text("with", width/2, height/2);
  pg.text("Children", width/2, height/2 + 180);
  pg.endDraw();

 //store the location for elements
 if (elms.size() < 4000){
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
 background(255);
 int eAmount = 500; //display amount at once
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
  if(lineNum > lines.length){
    lineNum = 0;
  }
}
