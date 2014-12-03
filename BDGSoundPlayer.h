//
//  BDGSoundPlayer.h
//
//  Created by Bob de Graaf on 20-06-14.
//  Copyright 2014 GraafICT. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const BDGSoundOn;

@interface BDGSoundPlayer : NSObject
{
    
}

#define BDGSoundPlayah [BDGSoundPlayer sharedBDGSoundPlayer]

+(BDGSoundPlayer *)sharedBDGSoundPlayer;

//Complex sounds for AVAudioPlayer
-(void)stopSoundFromFile;
-(void)playSoundFromFile:(NSURL *)fileURL;
-(void)playSoundFromFile:(NSURL *)fileURL indefinitely:(BOOL)indefinitely;
-(void)fadeSound:(float)duration fadeOut:(BOOL)fadeOut;

//Simple sounds for AudioToolBox
-(void)playSound:(NSString *)soundID;
-(void)loadSounds:(NSArray *)soundNamesWithNameAsID;
-(void)loadSound:(NSString *)fileName forID:(NSString *)soundID;

@end