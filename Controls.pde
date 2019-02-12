void keyPressed() {
  switch(key) {      
    case ' ':
      if (!isRecording) {
        isRecording = true;
        startVideoExport();
        startMinimRecording(); // must go after video to improve sync
      } else {
        stopMinimRecording(); // must go before video to create audio file
        stopVideoExport();
        isRecording = false;
      }
      break;
    case 'r':
      setupPeasyCam();
  }  
}
