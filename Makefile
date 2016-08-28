TWEAK_NAME = BrowserChooser
BrowserChooser_FILES = Tweak.x
BrowserChooser_FRAMEWORKS = Foundation UIKit
BrowserChooser_LIBRARIES = applist

THEOS_PLATFORM_SDK_ROOT_armv6 = /Applications/Xcode_Legacy.app/Contents/Developer
INCLUDE_SDKVERSION_armv6 = 8.4
SDKVERSION_armv6 = 5.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION_armv6 = 3.2

ifeq ($(FINALPACKAGE),1)
IPHONE_ARCHS = armv6 arm64
else
IPHONE_ARCHS = armv7 arm64
endif

INSTALL_TARGET_PROCESSES = SpringBoard

include framework/makefiles/common.mk
include framework/makefiles/tweak.mk
