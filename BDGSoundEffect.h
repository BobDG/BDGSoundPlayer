//
//  BDGSoundEffect.h
//
//  Created by Bob de Graaf on 20-06-14.
//  Copyright 2014 GraafICT. All rights reserved.
//

#import <AudioToolbox/AudioServices.h>

@interface BDGSoundEffect : NSObject
{
    SystemSoundID soundID;
}

-(id)initWithSoundNamed:(NSString *)filename;

-(void)play;

@end