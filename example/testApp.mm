#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    vector<string> voices = ofxVoiceSynthesizer::getVoices();
    for(int i = 0; i < voices.size(); i++) {
        ofLogWarning() << voices[i];
    }
    synth.setup("com.apple.speech.synthesis.voice.kyoko.premium");
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
    if(key == OF_KEY_RETURN) {
        synth.stopSpeaking();
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