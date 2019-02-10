import com.hamoid.*;

VideoExport videoExport;

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
  videoExport.setAudioFileName(audioFilePath);
  videoExport.startMovie();
}

void updateVideoExport() {
  videoExport.saveFrame();
}
void stopVideoExport() {
    videoExport.endMovie();
}
