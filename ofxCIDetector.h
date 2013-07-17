//
//  ofxCIDetector.h
//
//  Created by ISHII Tsuubito on 2013/07/17.
//
//

#ifndef __ofxCIDetector__
#define __ofxCIDetector__

#include "ofMain.h"
#include <CoreImage/CoreImage.h>

struct ofxFace {
    ofRectangle rectangle;
    
    bool hasLeftEyePoint;
    ofPoint leftEyePoint;
    
    bool hasRightEyePoint;
    ofPoint rightEyePoint;
    
    bool hasMouthPoint;
    ofPoint mouthPoint;
};

class ofxCIDetector {
public:
    static vector<ofxFace> getFaces(ofImage image) {
        vector<ofxFace> faces;
        
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        CGColorSpaceRef colorSpace;
        CGContextRef cgContext;
        
        colorSpace = CGColorSpaceCreateDeviceRGB();
        
        int width = image.getWidth();
        int height = image.getHeight();
        ofImageType imageType = image.getPixelsRef().getImageType();
        if(imageType == OF_IMAGE_COLOR_ALPHA) {
            cgContext = CGBitmapContextCreate(image.getPixels(), width, height, 8, width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
        } else if(imageType == OF_IMAGE_COLOR) {
            unsigned char *buf = image.getPixels();
            unsigned char rgba[width * height * 4];
            for(int i = 0; i < width * height; ++i) {
                rgba[4 * i]     = buf[3 * i];
                rgba[4 * i + 1] = buf[3 * i + 1];
                rgba[4 * i + 2] = buf[3 * i + 2];
                rgba[4 * i + 3] = 0;
            }
            cgContext = CGBitmapContextCreate(rgba, width, height, 8, width * 4, colorSpace, kCGImageAlphaNoneSkipLast);
        }
        CGColorSpaceRelease(colorSpace);
        
        // 画像の作成
        CGImageRef cgImage = CGBitmapContextCreateImage(cgContext);
        CIImage *ciImage = [CIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
        CGContextRelease(cgContext);
        
        NSDictionary *options = @{CIDetectorAccuracy : CIDetectorAccuracyHigh};
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                                  context:nil
                                                  options:options];
        
        
        NSDictionary *fOptions = @{CIDetectorImageOrientation : @(1)};
        NSArray *features = [detector featuresInImage:ciImage options:fOptions];
//        NSArray *features = [detector featuresInImage:ciImage options:nil];
        
        if([features count]) for (CIFaceFeature *f in features) {
            ofxFace face;
            
            face.rectangle.set(f.bounds.origin.x, height - f.bounds.origin.y - f.bounds.size.height, f.bounds.size.width, f.bounds.size.height);
            
            face.hasLeftEyePoint = f.hasLeftEyePosition;
            if(f.hasLeftEyePosition) {
                NSLog(@"has left eye : %f %f", f.leftEyePosition.x, f.rightEyePosition.y);
                face.leftEyePoint.set(f.leftEyePosition.x, height - f.leftEyePosition.y);
            }
            
            face.hasRightEyePoint = f.hasRightEyePosition;
            if(f.hasRightEyePosition) {
                NSLog(@"has right eye : %f %f", f.rightEyePosition.x, f.rightEyePosition.y);
                face.rightEyePoint.set(f.rightEyePosition.x, height - f.rightEyePosition.y);
            }
            
            face.hasMouthPoint = f.hasMouthPosition;
            if(f.hasMouthPosition) {
                NSLog(@"has mouth : %f %f", f.mouthPosition.x, f.mouthPosition.y);
                face.mouthPoint.set(f.mouthPosition.x, height - f.mouthPosition.y);
            }
            
            faces.push_back(face);
        }
        
        [pool release];

        
        return faces;
    }
private:
};

#endif /* defined(__emptyExample__ofxCIDetector__) */
