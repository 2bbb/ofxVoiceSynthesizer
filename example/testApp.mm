#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    vector<string> voices = ofxVoiceSynthesizer::getVoices();
    for(int i = 0; i < voices.size(); i++) {
        ofLogWarning() << voices[i];
    }
    synth.setup("com.apple.speech.synthesis.voice.Bruce");
    
    string dictionaryPath = ofToDataPath("SpeechDictionaryExample.plist", true);
    synth.addSpeechDictionary(dictionaryPath);
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){

}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    if(key == ' ') {
        synth.speak("こんにちは。私は of x voice synthesizer です。");
    }
    if(key == 'e') {
        synth.speak("hello. I am of x voice synthesizer.");
    }
    
    if(key == 'j') {
        synth.setVoice("com.apple.speech.synthesis.voice.kyoko.premium");
    }
    if(key == 'u') {
        synth.setVoice("com.apple.speech.synthesis.voice.Bruce");
    }
    
    if(key == OF_KEY_RETURN) {
        synth.stopSpeaking();
    }
    if('A' <= key && key <= 'Z') {
        string s = ofToString((char)key);
        synth.speak(s);
    }
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){

}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){
    ofLogWarning() << msg.message;
}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){ 

}