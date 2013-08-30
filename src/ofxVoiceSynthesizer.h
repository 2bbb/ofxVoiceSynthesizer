//
//  ofxVoiceSynthesizer.h
//
//  Created by ISHII 2bit on 13/06/18.
//
//

#import "ofMain.h"
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#pragma once

@class ofxVoiceSynthesizerDelegate;

class ofxVoiceSynthesizer {
public:
    static vector<string> getVoices();
    static string getDefaultVoice();
    
    ofxVoiceSynthesizer();
    ~ofxVoiceSynthesizer();
    
    void setup(string voiceName,
               string successMessage = "ofxVoiceSysnthesizerSuccess",
               string failureMessage = "ofxVoiceSysnthesizerFailure");
    void prepare();
    
    float getRate() const;
    void setRate(float rate);
    
    float getVolume() const;
    void setVolume(float volume);
    
    void speak(string text);
    bool isSpeaking() const;
    void stopSpeaking();
    
    void addSpeechDictionary(string path);
private:
    static bool wasLoadLib;
    NSSpeechSynthesizer *speakSynth;
    ofxVoiceSynthesizerDelegate *voiceSynthesizerDelegate;
};