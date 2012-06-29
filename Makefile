TWEAK_NAME = BrowserChooser
BrowserChooser_FILES = Tweak.x
BrowserChooser_FRAMEWORKS = Foundation UIKit

ADDITIONAL_CFLAGS = -std=c99
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 5.0

include framework/makefiles/common.mk
include framework/makefiles/tweak.mk
