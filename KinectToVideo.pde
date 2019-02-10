PFont font;
int fontSize = 18;
int lastButtonPress = 0;
int textDelay = 2000;
boolean isRecording = false;
int sample = 4;
int syncDelay = 100;

void setup() {
  size(1280, 720, P3D);  
  setupPeasyCam();
  
  font = loadFont("Silkscreen-18.vlw");
  textFont(font, fontSize);
  
  strokeWeight(sample);

  setupKinect(); 
  setupMinim();
  setupVideoExport();
  lastButtonPress = millis();
}

void draw() {
  updateKinect();
  background(0);
  
  if (isRecording) {
    cam.beginHUD();
    image(depthImg, 0, 120);
    image(rgbImg, 640, 120);
    updateVideoExport();
    text("RECORDING: " + currentFileName, fontSize, 1.5*fontSize);
    cam.endHUD();
  } else {
    beginShape(POINTS);
    for (int x=0; x<depthImg.width; x+=sample) {
      for (int y=0; y<depthImg.height; y+=sample) {
        int loc = x + y * depthImg.width;
        PVector p = realDepth[loc];
        stroke(rgbImg.pixels[loc]);
        vertex(p.x, -p.y, -p.z);
      }
    }
    endShape();
  }    
  
  surface.setTitle(""+frameRate);
}

void stop() {
  stopMinim(); // must go before video
  stopVideoExport();
}
