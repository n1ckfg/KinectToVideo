# KinectToVideo
### Nick Fox-Gieg | fox-gieg.com
This is a Processing app that records Holoflix format RGBD videos in the ProRes codec. It uses ffmpeg and the SimpleOpenNI library for maximum compatibility--it supports the Kinect v2, Kinect v1, and the Kinect v1 clones on OS X. It can also work with Kinect v1 on Windows, and with the Kinect v1 clones on some Windows systems with compatible USB hardware. (It doesn't work with Kinect v2 on Windows, but there are lots of other solutions for that combination.)

### Controls
Press space to start/stop recording--that's it. The settings.json file also contains the ffmpeg, settings if you'd like to experiment with recording to different codecs.

### OS X SETUP
Tested with Kinect v1 (1414), Asus Xtion, PrimeSense Carmine
<ol>
<li>
	Java apps now need to be approved in the Terminal on OS X. Cd to the application directory and type:<br>
```bash
xattr -d com.apple.quarantine KinectToVideo.app
```
</li>
<li>
	Set up the Homebrew package manager for OS X if you haven't already:<br>
	https://brew.sh/
</li>

<li>
	Use Homebrew to install ffmpeg:<br>
```bash
brew install ffmpeg
```
</li>

<li>
	For Kinect v1, Asus Xtion, or Primesense Carmine--use Homebrew to install OpenNI drivers for your hardware, or else use this installer:<br>
	http://sensecast.com/files/Sensecast.and.Libs.Installer.v.0.02.dmg
</li>

<li>
	Download the SimpleOpenNI library and place it at the root of your boot drive:<br>
	https://github.com/totovr/SimpleOpenNI
</li>

<li>
	Instructions for setting up Kinect v2 on OS X (not tested):<br>
	https://github.com/totovr/SimpleOpenNI/blob/master/README.md
</li>

<li>
	Instructions for setting up Orbbec Astra (not tested):<br>
	https://3dclub.orbbec3d.com/t/running-simpleopenni-with-orbbec-sensors/35
</li>
</ol>

### WINDOWS SETUP
(Not tested yet.)
<ol>
<li>
	For Kinect v1, download and install the Kinect SDK 1.8:<br>
	https://www.microsoft.com/en-ca/download/details.aspx?id=40278
</li>
<li>
	Install the Zeranoe build of ffmpeg for Windows:<br>
	https://ffmpeg.zeranoe.com/builds/
</li>
<li>
	Download the SimpleOpenNI library and place it at the root of your C drive:<br>
	https://github.com/totovr/SimpleOpenNI
</li>
<li>
	Instructions for setting up Orbbec Astra (not tested):<br>
	https://3dclub.orbbec3d.com/t/running-simpleopenni-with-orbbec-sensors/35
</li>
</ol>
