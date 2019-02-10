void keyPressed() {
  switch(key) {      
    case ' ':
      if (!isRecording) {
        isRecording = true;
        startMinimRecording(); // must go before video
        startVideoExport();
      } else {
        stopMinimRecording(); // must go before video
        stopVideoExport();
        isRecording = false;
      }
      break;
  }  
}
