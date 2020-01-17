import processing.sound.*;

int speed=5;
int xPos=400;
int yPos=400;
int direction=speed;
int directionY=0;
float dist=0;
PImage img;
PImage stumps; 
PImage d;
gif giphy;
gif battsman;
SoundFile file;
String audioName = "bruhh.mp3";
String path;




void setup()
{

  size (800, 800);
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  img= loadImage("nice.gif");
  giphy =  new gif("giphy animation");
  stumps = loadImage("/Users/ak/Desktop/sketch_191119b/data/stump.jpg");
  battsman = new gif("Batsman"); 
  stumps.resize(50, 50);
  d=loadImage("/Users/ak/Desktop/sketch_191119b/data/d.jpg");
  smooth();
  background(0);
  noStroke(); 
  fill(0, 255, 0);
}

void draw()
{
  background(0);
  image(d, 0, 0, 800, 400);

//giphy.DrawStill(100, 200);




  ellipse(xPos, yPos, 30, 30);
  xPos=xPos-direction;
  yPos=yPos-directionY;
  image(stumps, 50, 400, 100, 100);


  battsman.DrawStill(100, 200);


  dist=dist(200, 400, xPos, yPos);
  if ( dist < 35)
  {
    if ( keyPressed)
    {
      if (key==' ')
      {
        directionY=5;
        if (!file.isPlaying())
        {

          file.play();
        }
      }
    }
    if (xPos<0||xPos>800&&yPos<0||yPos>800)
    {
      xPos=400;
      yPos=400;
    }
  }





  if (xPos>width-20 || xPos<20)
  {
    xPos=-20;
    direction=-direction;
    battsman.Play(100, 200);
    giphy.Play(100, 200);
    image(img, 50, 400);
  }
}
