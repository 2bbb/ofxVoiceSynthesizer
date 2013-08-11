# ofxVoiceSynthesizer (OSX)

## How to use

1. Add AppKit.framework to your project
2. Add ofxVoiceSynthesizer & ofxObjective-C++Utility to your project and include ofxVoiceSynthesizer.h
3. Rename all files have extention like .cpp to .mm / Or, open Project Setting -> TARGETS -> Build Phases -> Compile Sources, and add flag "-x objective-c++" for all file of .cpp

## Dependencies

ofxObjective-C++Utility [__https://github.com/2bbb/ofxObjective-C--Utility__]

## API

### ofxVoiceSynthesizer

* static vector<string> getVoices()

return vector of voice names like _com.apple.speech.synthesis.voice.kyoko_

* static getDefaultVoice()

return voice name of your system default

* void setup(string voiceName, string successMessage, string failureMessage)

**successMessage** (default "ofxVoiceSysnthesizerSuccess") and **failureMessage** (default "ofxVoiceSysnthesizerFailure") is post by **ofSendMessage** when finish speaking with success or failure.

* float getRate()
* void setRate(float rate)

get/set speaking rate.

* float getVolume()
* void setVolume(float volume)

get/set speaking volume.

* void speak(string text)

Start to speak **text**.

* bool isSpeaking()

return _true_ when speaking

* void stopSpeaking()

Stop speaking.

## Update history

### 2013/07/18 ver 0.01 beta release

* Let's speak!!

## License

MIT License.

## Author

* ISHII 2bit [bufferRenaiss co., ltd.]
* ishii[at]buffer-renaiss.com