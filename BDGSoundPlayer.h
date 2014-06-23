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

+(BDGSoundPlayer *)sharedBDGSoundPlayer;

-(void)playSound:(NSString *)soundID;
-(void)playSoundFromFile:(NSString *)fileName;
-(void)loadSounds:(NSArray *)soundNamesWithNameAsID;
-(void)loadSound:(NSString *)fileName forID:(NSString *)soundID;

@end