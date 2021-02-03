import ddf.minim.*;

Minim minim;
AudioInput in;
AudioRecorder fout;
SyncTimer syncTimer;

int minimElapsedTime;

String baseFileName = "capture";
String currentFileName = "";
String videoUrl = "";
String audioUrl = "";
float sampleRate;

void setupMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  sampleRate = in.sampleRate();
}

void startMinimRecording() {
  currentFileName = baseFileName + "_" + getTimestamp();
  videoUrl = sketchPath("") + "capture/" + currentFileName + ".mp4";
  audioUrl = sketchPath("") + "capture/" + currentFileName + ".wav";
  
  syncTimer = new SyncTimer();
  in.addListener(syncTimer);
  
  fout = minim.createRecorder(in, audioUrl, true);
  fout.beginRecord();
  minimElapsedTime = 0;
}

void stopMinimRecording() {
  if (fout.isRecording()) {
    fout.endRecord();
    fout.save();
    in.removeListener(syncTimer);
  }
}

void stopMinim() {
  in.close();
  minim.stop();
}

// http://code.compartmental.net/minim/audioinput_method_addlistener.html

class SyncTimer implements AudioListener {
  
  private float[] left;
  //private float[] right;
  
  SyncTimer() {
    left = null; 
    //right = null;
  }
  
  public synchronized void samples(float[] samp) {
    left = samp;
  }
  
  public synchronized void samples(float[] sampL, float[] sampR) {
    left = sampL;
    //right = sampR;
  }
  
  synchronized void draw() {
    float newSamples = (float) left.length;
    minimElapsedTime += int(newSamples / sampleRate) * 1000;
  }
  
}
