Pod::Spec.new do |s|
  s.name           	= 'BDGSoundPlayer'
  s.version        	= '0.0.1'
  s.summary        	= 'Lightweight audio player with 1 line of code, supports simple system sounds but also mp3 files'
  s.description 	= 'A lightweight audio player that can be dropped in any xCode project. You can preload simple audio files such as .caf/.wav/etc. and then play them with 1 line of code. You can also play mp3 files with 1 line of code from anywhere.'
  s.homepage       	= 'https://github.com/BobDG/BDGSoundPlayer'
  s.authors        	= {'Bob de Graaf' => 'graafict@gmail.com'}
  s.license 		= 'MIT'
  s.source         	= { :git => 'https://github.com/BobDG/BDGSoundPlayer.git', :tag => '0.0.1' }
  s.source_files   	= '**/*.{h,m}'
  s.frameworks 	    	= 'AVFoundation', 'AudioToolbox'
  s.platform       	= :ios
  s.requires_arc   	= true
end
