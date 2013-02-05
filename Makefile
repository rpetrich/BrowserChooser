TWEAK_NAME = BrowserChooser
BrowserChooser_FILES = Tweak.x
BrowserChooser_FRAMEWORKS = Foundation UIKit
BrowserChooser_LIBRARIES = applist

ADDITIONAL_CFLAGS = -std=c99
SDKVERSION := 5.1
INCLUDE_SDKVERSION := 6.0
TARGET_IPHONEOS_DEPLOYMENT_VERSION := 5.0

include framework/makefiles/common.mk
include framework/makefiles/tweak.mk
