BDGSoundPlayer
==============

Lightweight iOS soundplayer to load/cache simple .caf/wav files or play mp3 files using avaudioplayer.


## Installation using Cocoapods
```
pod 'BDGSoundPlayer'
```

##Simple files (caf, .wav, etc)

Load the file using:

[[BDGSoundPlayer sharedBDGSoundPlayer] loadSound:fileName forID:soundID];

Play the file using

[[BDGSoundPlayer sharedBDGSoundPlayer] playSound:soundID]


## Files that need AVAudioPlayer (MP3, etc.)

Play the file immediately using:

[[BDGSoundPlayer sharedBDGSoundPlayer] playSoundFromFile:fileName];


### Additional options

Enable/Disable all sounds

The soundplayer uses the NSUserDefaults to cache a boolean using the NSString const BDGSoundOn to indicate whether sounds should be played. You can use this boolean to enable/disable all sounds.