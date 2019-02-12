int kinectLookupTableSize = 10000;
float kinectDepthScale = 10;
float[] kinectLookupTable = new float[kinectLookupTableSize];

void setupKinectLookupTable() {
  for (int i=0; i<kinectLookupTable.length; i++) {
    kinectLookupTable[i] = map(i, 0, kinectLookupTableSize, 0, 255) * kinectDepthScale;
  }
}

float getGrayDepthValue(int val) {
  return kinectLookupTable[val];
}

static final int gray(color value) { 
  return max((value >> 16) & 0xff, (value >> 8 ) & 0xff, value & 0xff);
}
