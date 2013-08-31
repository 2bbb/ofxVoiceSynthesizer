//
//  ofxVoiceSynthesizer.h
//
//  Created by ISHII 2bit on 13/06/18.
//
//

#import "ofMain.h"
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#include "ofxVoices.h"

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
    
    string getCurrentVoiceName();
    void setVoice(string voiceName);
    
    float getRate() const;
    void setRate(float rate);
    
    float getVolume() const;
    void setVolume(float volume);
    
    void speak(string text);
    bool isSpeaking() const;
    void stopSpeaking();
    
    void addSpeechDictionary(string path);
    
    string phonemes(string text);
private:
    static bool wasLoadLib;
    NSSpeechSynthesizer *speakSynth;
    ofxVoiceSynthesizerDelegate *voiceSynthesizerDelegate;
};