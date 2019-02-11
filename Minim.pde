import ddf.minim.*;

Minim minim;
AudioInput in;
AudioRecorder fout;

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void startMinimRecording() {
  fout = minim.createRecorder(in, audioUrl, true);
  fout.beginRecord();
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
