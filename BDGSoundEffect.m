//
//  BDGSoundEffect.m
//
//  Created by Bob de Graaf on 20-06-14.
//  Copyright 2014 GraafICT. All rights reserved.
//

#import "BDGSoundEffect.h"

@implementation BDGSoundEffect

-(id)initWithSoundNamed:(NSString *)filename
{
    self = [super init];
    if(self) {
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if(fileURL != nil) {
            SystemSoundID theSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
            if(error == kAudioServicesNoError) {
                soundID = theSoundID;
            }
            else {
                NSLog(@"BDGSoundPlayer: Error creating systemSoundID for filename: %@", filename);
            }
        }
    }
    return self;
}

-(void)dealloc
{
    AudioServicesDisposeSystemSoundID(soundID);
}

-(void)play
{
    AudioServicesPlaySystemSound(soundID);
}

@end
