KinectToVideo  |  fox-gieg.com
Processing app to record Holoflix format ProRes clips.

It uses ffmpeg and the SimpleOpenNI library, prioritizing compatibility over performance. It's primarily aimed at providing a solution for Kinect v1/clones and OS X users. It should also work on many Windows setups with USB2 ports, but has not been as extensively tested.

Tested on OS X with:
Kinect v1 (1414)
Asus Xtion
PrimeSense Carmine

CONTROLS
Space: start/stop recording

SETUP:
1. Set up the Homebrew package manager for OS X:
https://brew.sh/

2. Use Homebrew to install ffmpeg:
brew install ffmpeg

3. For Kinect v1, Asus Xtion, or Primesense Carmine--use Homebrew to install OpenNI drivers for your hardware, or else use this installer:
http://sensecast.com/files/Sensecast.and.Libs.Installer.v.0.02.dmg

4. Download the SimpleOpenNI library and place it at the root of your boot drive:
https://github.com/totovr/SimpleOpenNI

5. Extra instructions for setting up Kinect v2 on OS X (not tested):
https://github.com/totovr/SimpleOpenNI/blob/master/README.md

6. Extra instructions for setting up Orbbec on OS X or Windows (not tested):
https://3dclub.orbbec3d.com/t/running-simpleopenni-with-orbbec-sensors/35


