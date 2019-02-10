PFont font;
int fontSize = 18;
int lastButtonPress = 0;
int textDelay = 2000;
boolean isRecording = false;

void setup() {
  size(1280, 720, P2D);  
  frameRate(30);
  
  font = loadFont("Silkscreen-18.vlw");
  textFont(font, fontSize);
  setupKinect(); 
  setupMinim(); // must go before video
  setupVideoExport();
  lastButtonPress = millis();
}

void draw() {
  background(0);
  
  updateKinect();
  image(depthImg, 0, 120);
  image(rgbImg, width/2, 120);
  
  if (isRecording) updateVideoExport();
  
  text("rec: " + isRecording, fontSize, 1.5*fontSize);
  surface.setTitle(""+frameRate);
}

void stop() {
  stopMinim(); // must go before video
  stopVideoExport();
}
