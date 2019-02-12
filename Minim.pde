import ddf.minim.*;

Minim minim;
AudioInput in;
AudioRecorder fout;
int minimElapsedTime = 0;
int minimStartTime = 0;

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void startMinimRecording() {
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
