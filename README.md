# ofxCIDetector (for iPhone)

## How to use

1. Add CoreImage.framework to your project
2. Include ofxCIDetector.h
3. Call ofxCIDetector::getFaces(image)

## API

### ofxCIDetector

#### class method

* static vector<ofxFace> ofxCIDetector::getFaces(ofImage image)

### ofxFace

#### property

* ofRectangle rectangle

* bool hasLeftEyePoint
* bool hasRightEyePoint
* bool hasMouthPoint

* ofPoint leftEyePoint
* ofPoint rightEyePoint
* ofPoint mouthPoint

## Update history

### ver 0.01 beta release

* **unsupported** gray scale ofImage

