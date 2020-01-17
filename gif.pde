import java.util.Date;

//https://ezgif.com/split
// use EZ GIF to SPLIT your gif into many individual images
//Export (as zip) a folder of all image frames.
//Unzip Folder and name the folder something ex. "PlayerAttack"
// place folder in data.
//Create a GIF type in main, and gif name = new gif("PlayerAttack");
class gif
{

  int frameLength;
  int numberOfFrames;
  int currentFrame;
  boolean isPlaying;
  PImage[] images;
  String path;
  float timer;
  

  gif(String _path)
  {
    path = sketchPath()+"/data/"+_path;
    println("\nListing info about all files in a directory: ");
    File[] files = listFiles("/Users/ak/Desktop/sketch_191119b/data/Batsman"); //<>//
    print(path, files);
    print(path); //<>//
    images = new PImage[files.length]; //<>//
    for (int i = 0; i < files.length; i++) {
      File f = files[i];
      println(f.getName());
      images[i] = loadImage("/Users/ak/Desktop/sketch_191119b/data/Batsman/"+f.getName());
      println("Name: " + f.getName());
      println("Is directory: " + f.isDirectory());
      println("Size: " + f.length());
      String lastModified = new Date(f.lastModified()).toString();
      println("Last Modified: " + lastModified);
      println("-----------------------");
      
    }
    
    frameLength = 2000;
    numberOfFrames = images.length;
    isPlaying = false;
    timer =0;
    currentFrame=0;
    
  }
  
  void Play(float x, float y)
  {
    if(millis() - timer > frameLength)
    {
      timer = millis();
      currentFrame++;
      
      if(currentFrame > images.length-1)
      {
        currentFrame = 0;
      }
    }
    image(images[currentFrame], x,y);
  }
  
  void PlayMirror(float x, float y)
  {
    if(millis() - timer > frameLength)
    {
      timer = millis();
      currentFrame++;
      
      if(currentFrame > images.length-1)
      {
        currentFrame = 0;
      }
    }
    pushMatrix();
    translate(x,y);
    scale(-1,1);
    image(images[currentFrame], 0,0);
    popMatrix();
    
  }
  
  void Resize(int _w, int _h)
  {
    for(int i=0; i < images.length; i++)
    {
      images[i].resize(_w,_h);
    }
    
  }
  
  void Scale(int _s)
  {
    
  }
  
  
  void setFrameLength(int _frameLength)
  {
    frameLength = _frameLength;
  }
  
  void setCurrentFrame(int _frame)
  {
    currentFrame =0;
  }
  
   void DrawStill(float _x, float _y)
  {
    image(images[0], _x,_y); //<>//
  }
  
  
  
}
