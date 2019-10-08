import ddf.minim.*;

Minim minim;
AudioInput in;
AudioRecorder fout;
int minimElapsedTime;
int minimStartTime;

String baseFileName = "capture";
String currentFileName = "";
String videoUrl = "";
String audioUrl = "";

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void startMinimRecording() {
  currentFileName = baseFileName + "_" + getTimestamp();
  videoUrl = sketchPath("") + "capture/" + currentFileName + ".mp4";
  audioUrl = sketchPath("") + "capture/" + currentFileName + ".wav";
  
  fout = minim.createRecorder(in, audioUrl, true);
  fout.beginRecord();
  minimStartTime = millis();
  minimElapsedTime = 0;
}

void updateMinimRecording() {
  minimElapsedTime = millis() - minimStartTime;
}

void stopMinimRecording() {
  if (fout.isRecording()) {
    fout.endRecord();
    fout.save();
  }
}

void stopMinim() {
  in.close();
  minim.stop();
}
