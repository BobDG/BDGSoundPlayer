//
//  BDGSoundPlayer.m
//
//  Created by Bob de Graaf on 20-06-14.
//  Copyright 2014 GraafICT. All rights reserved.
//

#import <AVFoundation/AVAudioPlayer.h>

#import "BDGSoundEffect.h"
#import "BDGSoundPlayer.h"

NSString *const BDGSoundOn = @"BDGSoundOn";

@interface BDGSoundPlayer ()
{
    
}

@property(nonatomic,strong) AVAudioPlayer *audioPlayer;
@property(nonatomic,strong) NSMutableDictionary *sounds;

@end

@implementation BDGSoundPlayer

-(id)init
{
    self = [super init];
    if(self) {
        _sounds = [[NSMutableDictionary alloc] init];
        if(![[NSUserDefaults standardUserDefaults] objectForKey:BDGSoundOn]) {
            [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:BDGSoundOn];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    return self;	
}

#pragma mark AVAudioPlayer Sounds

-(void)stopSoundFromFile
{
    [self.audioPlayer stop];
}

-(void)fadeSound:(float)duration fadeOut:(BOOL)fadeOut
{
    if((fadeOut && self.audioPlayer.volume <= 0.0f) || (!fadeOut && self.audioPlayer.volume >= 1.0f)) {
        return;
    }
    
    float durationVolumeValue = 1.0f/duration/10.0f;
    if(fadeOut) {
        self.audioPlayer.volume = MAX(0, self.audioPlayer.volume-durationVolumeValue);
    }
    else {
        self.audioPlayer.volume += durationVolumeValue;
    }
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [self fadeSound:duration fadeOut:fadeOut];
    });
}

-(void)playSoundFromFile:(NSURL *)fileURL indefinitely:(BOOL)indefinitely
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:BDGSoundOn]) {
        return;
    }
    
    if(self.audioPlayer) {
        [self.audioPlayer stop];
    }
    self.audioPlayer = nil;
    
    NSError *error = nil;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    if(indefinitely) {
        self.audioPlayer.numberOfLoops = -1;
    }
    if(error != nil) {
        NSLog(@"BDGSoundPlayer: Error loading audio file from URL: %@. Error: %@", fileURL, [error description]);
    }
    else {
        [self.audioPlayer play];
    }
}

-(void)playSoundFromFile:(NSURL *)fileURL
{
    [self playSoundFromFile:fileURL indefinitely:FALSE];
}

#pragma mark AudioToolBox Sounds

-(void)loadSounds:(NSArray *)soundNamesWithNameAsID
{
    for(NSString *soundName in soundNamesWithNameAsID) {
        [self loadSound:soundName forID:soundName];
    }
}

-(void)loadSound:(NSString *)fileName forID:(NSString *)soundID
{
    BDGSoundEffect *s = [[BDGSoundEffect alloc] initWithSoundNamed:fileName];
    [self.sounds setObject:s forKey:soundID];
}

-(void)playSound:(NSString *)soundID
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:BDGSoundOn]) {
        [((BDGSoundEffect *)[self.sounds objectForKey:soundID]) play];
    }
}

#pragma mark Singleton

+(id)sharedBDGSoundPlayer
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end











