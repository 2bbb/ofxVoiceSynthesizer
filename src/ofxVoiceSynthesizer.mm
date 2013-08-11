//
//  ofxVoiceSynthesizer.m
//
//  Created by ISHII 2bit on 13/06/18.
//
//

#import "ofxVoiceSynthesizer.h"
#import "ofxVoiceSynthesizerDelegate.h"
#import "ofxObjective-C++Utility.h"

bool ofxVoiceSynthesizer::wasLoadLib = false;

vector<string> ofxVoiceSynthesizer::getVoices() {
    vector<string> voices;
    for(NSString *voice in [NSSpeechSynthesizer availableVoices]) {
        voices.push_back(convert(voice));
    }
    return voices;
}

string ofxVoiceSynthesizer::getDefaultVoice() {
    return convert([NSSpeechSynthesizer defaultVoice]);
}

ofxVoiceSynthesizer::ofxVoiceSynthesizer() {

}

ofxVoiceSynthesizer::~ofxVoiceSynthesizer() {
    stopSpeaking();
    [speakSynth release];
    [voiceSynthesizerDelegate release];
}

void ofxVoiceSynthesizer::setup(string voiceName, string successMessage, string failureMessage)
{
    speakSynth = [[NSSpeechSynthesizer alloc] initWithVoice:convert(voiceName)];
    setVolume(0.0f);
    speak("a");
    while([speakSynth isSpeaking]) {
        usleep(10);
    }
    setVolume(1.0f);
    wasLoadLib = YES;
    
    voiceSynthesizerDelegate = [[ofxVoiceSynthesizerDelegate alloc] initWithSuccessMessage:successMessage
                                                                         andFailureMessage:failureMessage];
    [speakSynth setDelegate:(id<NSSpeechSynthesizerDelegate>)voiceSynthesizerDelegate];
}

float ofxVoiceSynthesizer::getRate() const {
    return [speakSynth rate];
}

void ofxVoiceSynthesizer::setRate(float rate) {
    [speakSynth setRate:rate];
}

float ofxVoiceSynthesizer::getVolume() const {
    return [speakSynth volume];
}

void ofxVoiceSynthesizer::setVolume(float volume) {
    [speakSynth setVolume:volume];
}

void ofxVoiceSynthesizer::speak(string text) {
    [speakSynth startSpeakingString:convert(text)];
}

bool ofxVoiceSynthesizer::isSpeaking() const {
    return [speakSynth isSpeaking];
}

void ofxVoiceSynthesizer::stopSpeaking() {
    [speakSynth stopSpeaking];
}