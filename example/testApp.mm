#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(127,127,127);
    
    image.loadImage("face.jpg");
    ofEnableAlphaBlending();
    ofEnableSmoothing();
}

//--------------------------------------------------------------
void testApp::update(){
}

//--------------------------------------------------------------
void testApp::draw(){
	vector<ofxFace> faces = ofxCIDetector::getFaces(image);
    
    ofLogWarning() << faces.size();
    
    ofSetColor(255, 255, 255);
    image.draw(0, 0);
    
    for(int i = 0; i < faces.size(); i++) {
        ofSetColor(255, 0, 0, 127);
        ofRect(faces[i].rectangle);
        
        ofSetColor(0, 0, 255, 127);
        if(faces[i].hasLeftEyePoint) ofCircle(faces[i].leftEyePoint, 8);
        if(faces[i].hasRightEyePoint) ofCircle(faces[i].rightEyePoint, 8);
        if(faces[i].hasMouthPoint) ofCircle(faces[i].mouthPoint, 8);
    }
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

