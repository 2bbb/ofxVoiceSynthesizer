//
//  ofxVoiceSynthesizerDelegate.h
//
//  Created by ISHII 2bit on 2013/08/12.
//
//

#import "ofMain.h"
#import <AppKit/AppKit.h>

@interface ofxVoiceSynthesizerDelegate : NSObject <NSSpeechSynthesizerDelegate> {
    string successMessage;
    string failureMessage;
}

- (instancetype)initWithSuccessMessage:(string)successMessage andFailureMessage:(string)failureMessage;

@end
