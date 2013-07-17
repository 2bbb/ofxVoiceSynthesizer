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

@interface VoiceSynthDelegate : NSObject <NSSpeechSynthesizerDelegate> {
    string successMessage;
    string failureMessage;
}

- (instancetype)initWithSuccessMessage:(string)successMessage andFailureMessage:(string)failureMessage;

@end

class ofxVoiceSynthesizer {
public:
    static vector<string> getVoices() {
        vector<string> voices;
        for(NSString *voice in [NSSpeechSynthesizer availableVoices]) {
            voices.push_back(stringFromNSString(voice));
        }
        return voices;
    }
    
    static string getDefaultVoice() {
        return stringFromNSString([NSSpeechSynthesizer defaultVoice]);
    }
    
    ofxVoiceSynthesizer() {};
    ~ofxVoiceSynthesizer() {
        stopSpeaking();
        [speakSynth release];
        [voiceSynthDelegate release];
    }
    
    void setup(string voiceName,
               string successMessage = "ofxVoiceSysnthesizerSuccess",
               string failureMessage = "ofxVoiceSysnthesizerFailure")
    {
        speakSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nsStringFromString(voiceName)];
        setVolume(0.0f);
        speak("a");
        while([speakSynth isSpeaking]) {
            usleep(30);
        }
        setVolume(1.0f);
        wasLoadLib = YES;
        
        voiceSynthDelegate = [[VoiceSynthDelegate alloc] initWithSuccessMessage:successMessage andFailureMessage:failureMessage];
        [speakSynth setDelegate:(id<NSSpeechSynthesizerDelegate>)voiceSynthDelegate];
    }
    
    float getRate() const {
        return [speakSynth rate];
    }
    
    void setRate(float rate) {
        [speakSynth setRate:rate];
    }
    
    float getVolume() const {
        return [speakSynth volume];
    }
    
    void setVolume(float volume) {
        [speakSynth setVolume:volume];
    }
    
    void speak(string text) {
        [speakSynth startSpeakingString:nsStringFromString(text)];
    }
    
    bool isSpeaking() const {
        return [speakSynth isSpeaking];
    }
    
    void stopSpeaking() {
        [speakSynth stopSpeaking];
    }
    
private:
    static bool wasLoadLib;
    NSSpeechSynthesizer *speakSynth;
    static NSString *nsStringFromString(string str) {
        return [NSString stringWithCString:str.c_str() encoding:NSUTF8StringEncoding];
    }
    
    static string stringFromNSString(NSString *str) {
        return string([str cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    VoiceSynthDelegate *voiceSynthDelegate;
};