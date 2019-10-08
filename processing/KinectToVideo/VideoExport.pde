import com.hamoid.*;

VideoExport videoExport;
int lastCapture;
int frameInterval = 33;
int frameErrorMargin = int(frameInterval/2) + 1;
int frameCounter;
int elapsedFrameTime;
int captureInterval;
//int errorAccumulation;
boolean videoSyncError = false;
String videoSyncStatus;
int nextFrameShift = 0;
    
// Press 'q' to finish saving the movie and exit.

// In some systems, if you close your sketch by pressing ESC, 
// by closing the window, or by pressing STOP, the resulting 
// movie might be corrupted. If that happens to you, use
// videoExport.endMovie() like you see in this example.

// In other systems pressing ESC produces correct movies
// and .endMovie() is not necessary.

void setupVideoExport() {
  videoExport = new VideoExport(this);
}

void startVideoExport() {
  videoExport.setMovieFileName(videoUrl);
  videoExport.setAudioFileName(audioUrl);
  //videoExport.setGraphics(buffer);
  videoExport.startMovie();
  lastCapture = 0;
  frameCounter = 0;
  elapsedFrameTime = 0;
  captureInterval = 0;
  //errorAccumulation = 0;
}

void updateVideoExport() {
  int numNormalFrames = 0;
  //int numErrorAccumulateFrames = 0;
  captureInterval += minimElapsedTime - lastCapture;
  
  if (captureInterval >= frameInterval) {
    numNormalFrames = int(round(captureInterval/frameInterval));
    //errorAccumulation += captureInterval - (numNormalFrames * frameInterval);
    //if (errorAccumulation >= frameInterval) {
      //numErrorAccumulateFrames = int(round(errorAccumulation/frameInterval));
      //errorAccumulation = 0;
    //}
    addVideoFrame(numNormalFrames + nextFrameShift);
    captureInterval = 0;
  }
  
  videoSyncError = checkVideoSyncError();
  if (videoSyncError) {
    if (minimElapsedTime > elapsedFrameTime) {
      nextFrameShift = -int(round(minimElapsedTime - elapsedFrameTime)/frameInterval) - 1;
    } else if (minimElapsedTime < elapsedFrameTime) {
      nextFrameShift = int(round(elapsedFrameTime - minimElapsedTime)/frameInterval) + 1;
    }
  } else {
    nextFrameShift = 0;
  }
  
  videoSyncStatus = "" + round(elapsedFrameTime / 1000.0);
  if (nextFrameShift != 0) videoSyncStatus += "   sync " + nextFrameShift;
  println(numNormalFrames + " " + nextFrameShift + " " + videoSyncError);
}

boolean checkVideoSyncError() {
    elapsedFrameTime = frameCounter * frameInterval;
    return elapsedFrameTime >= minimElapsedTime - frameInterval && elapsedFrameTime <= minimElapsedTime + frameInterval;
}

void addVideoFrame(int numFrames) {
  for (int i=0; i<numFrames; i++) {
    videoExport.saveFrame();
    frameCounter++;
  }
  lastCapture = minimElapsedTime;
}

void stopVideoExport() {
    videoExport.endMovie();
}

long getTimestamp() {
  java.util.Date d = new java.util.Date();
  return d.getTime()/1000; 
}
