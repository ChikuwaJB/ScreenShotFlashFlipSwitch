%hook SBScreenShotter
- (void)saveScreenshot:(_Bool)arg1
{
NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.chikuwa.screeshotflashflipswitch.plist"];

if([dict objectForKey:@"Flash"]?[[dict objectForKey:@"Flash"] boolValue]:YES){
%orig;
}else{
%orig(0);
}
}
%end