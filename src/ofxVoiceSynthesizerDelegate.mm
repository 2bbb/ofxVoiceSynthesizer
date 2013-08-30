//
//  ofxVoiceSynthesizerDelegate.mm
//
//  Created by ISHII 2bit on 2013/08/12.
//
//

#import "ofxVoiceSynthesizerDelegate.h"

@implementation ofxVoiceSynthesizerDelegate

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
    [self performSelectorOnMainThread:@selector(sendMessage:)
                           withObject:@(success)
                        waitUntilDone:NO];
}

- (void)sendMessage:(NSNumber *)success {
    ofSendMessage([success boolValue]? successMessage : failureMessage);
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
