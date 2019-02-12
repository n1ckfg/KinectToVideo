# KinectToVideo
## Nick Fox-Gieg | fox-gieg.com
A Processing app to record Holoflix format ProRes clips. It uses ffmpeg and the SimpleOpenNI library, prioritizing compatibility over performance. It's primarily aimed at providing a solution for Kinect v1/clones and OS X users. It should also work on many Windows setups with USB2 ports, but has not been as extensively tested.

### Controls
Press space to start/stop recording--that's it. The settings.json file also contains the ffmpeg settings if you'd like to experiment with recording to different codecs.

### OS X SETUP
Tested with Kinect v1 (1414), Asus Xtion, PrimeSense Carmine
<ol>
<li>
	Set up the Homebrew package manager for OS X:<br>
	https://brew.sh/
</li>

<li>
	Use Homebrew to install ffmpeg:<br>
	brew install ffmpeg
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
	Extra instructions for setting up Kinect v2 on OS X (not tested):<br>
	https://github.com/totovr/SimpleOpenNI/blob/master/README.md
</li>

<li>
	Extra instructions for setting up Orbbec Astra (not tested):<br>
	https://3dclub.orbbec3d.com/t/running-simpleopenni-with-orbbec-sensors/35
</li>
</ol>

### WINDOWS SETUP
Tested with Kinect v1 (1414)
<ol>
<li>
	Download and install the Kinect SDK 1.8:
	https://www.microsoft.com/en-ca/download/details.aspx?id=40278
</li>
<li>
	Install the Zeranoe build of ffmpeg for Windows:
	https://ffmpeg.zeranoe.com/builds/
</li>
<li>
	Download the SimpleOpenNI library and place it at the root of your C drive:<br>
	https://github.com/totovr/SimpleOpenNI
</li>
<li>
	Extra instructions for setting up Orbbec Astra (not tested):<br>
	https://3dclub.orbbec3d.com/t/running-simpleopenni-with-orbbec-sensors/35
</li>
</ol>
