void keyPressed() {
  switch(key) {      
    case ' ':
      if (!isRecording) {       
        isRecording = true;
        startMinimRecording();   
        startVideoExport();
      } else {
        stopMinimRecording(); // must go before video to create audio file
        stopVideoExport();
        setupVideoExport();
        setupMinim();
        isRecording = false;
      }
      break;
    case 'r':
      setupPeasyCam();
      break;
  }  
}
