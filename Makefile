ARCHS = armv7 arm64
GO_EASY_ON_ME=1
include theos/makefiles/common.mk

BUNDLE_NAME = ScreenShotFlashFlipSwitch
ScreenShotFlashFlipSwitch_FILES = Switch.x
ScreenShotFlashFlipSwitch_FRAMEWORKS = UIKit
ScreenShotFlashFlipSwitch_LIBRARIES = flipswitch
ScreenShotFlashFlipSwitch_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += ssffc
include $(THEOS_MAKE_PATH)/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"
