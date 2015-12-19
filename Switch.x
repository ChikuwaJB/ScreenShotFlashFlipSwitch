#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface ScreenShotFlashFlipSwitchSwitch : NSObject <FSSwitchDataSource>
@end

@implementation ScreenShotFlashFlipSwitchSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist"];
	if([settings objectForKey:@"Flash"] ? [[settings objectForKey:@"Flash"] boolValue] : YES){
		return FSSwitchStateOn;
	}else{
		return FSSwitchStateOff;
	}
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist"];
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		if(settings){
			[settings setObject:[NSNumber numberWithBool:1] forKey:@"Flash"];
			[settings writeToFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist" atomically:NO];
		}else{
			settings=[NSMutableDictionary dictionary];
			[settings writeToFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist" atomically:NO];
		}
		break;
	case FSSwitchStateOff:
		if(settings){
			[settings setObject:[NSNumber numberWithBool:0] forKey:@"Flash"];
			[settings writeToFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist" atomically:NO];
		}else{
			settings=[NSMutableDictionary dictionary];
			[settings writeToFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist" atomically:NO];
		}
		break;
	}
}
- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"Screen Shot Flash";
}
@end
