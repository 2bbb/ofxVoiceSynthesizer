//
//  ofxVoiceSynthesizer.m
//
//  Created by ISHII 2bit on 13/06/18.
//
//

#import "ofxVoiceSynthesizer.h"

@implementation VoiceSynthDelegate

- (instancetype)initWithSuccessMessage:(string)_successMessage
           andFailureMessage:(string)_failureMessage
{
    self = [super init];
    if(self) {
        successMessage = _successMessage;
        failureMessage = _failureMessage;
    }
    return self;
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
        didFinishSpeaking:(BOOL)success
{
    ofSendMessage(success ? successMessage : failureMessage);
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
 didEncounterErrorAtIndex:(NSUInteger)characterIndex
                 ofString:(NSString *)string
                  message:(NSString *)message
{
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
  didEncounterSyncMessage:(NSString *)message
{
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
         willSpeakPhoneme:(short)phonemeOpcode
{
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
            willSpeakWord:(NSRange)wordToSpeak
                 ofString:(NSString *)text
{
}

@end

bool ofxVoiceSynthesizer::wasLoadLib = false;