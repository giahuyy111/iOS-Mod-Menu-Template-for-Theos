# Thiết lập kiến trúc và chế độ biên dịch
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

# Bỏ qua các cảnh báo không cần thiết để build mượt hơn
IGNORE_WARNINGS = 1

# Đường dẫn SDK - Phải khớp với phiên bản tải trong file main.yml
SDK_PATH = $(THEOS)/sdks/iPhoneOS14.5.sdk
SYSROOT = $(SDK_PATH)

# Khai báo các thư mục chứa nguồn code
KITTYMEMORY_SRC = $(wildcard KittyMemory/*.cpp)
MENU_SRC = Menu.mm
SCL_SRC = $(wildcard SCLAlertView/*.m)

include $(THEOS)/makefiles/common.mk

# Tên bản Mod của bạn (Sẽ hiện trong dylib)
TWEAK_NAME = HexaFF

# Các tùy chỉnh biên dịch cho C++ và Objective-C
HexaFF_CFLAGS = -fobjc-arc
HexaFF_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG

# Danh sách các file sẽ tham gia vào quá trình biên dịch
# Quan trọng: Phải có Tweak.xm, Menu.mm và KittyMemory
HexaFF_FILES = Tweak.xm $(MENU_SRC) $(KITTYMEMORY_SRC) $(SCL_SRC)

# Thư viện hệ thống cần thiết để vẽ Menu và Hook game
HexaFF_LIBRARIES = substrate
HexaFF_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AdSupport

# Lệnh thực thi biên dịch
include $(THEOS_MAKE_PATH)/tweak.mk

# Dọn dẹp sau khi build xong
after-install::
	install.exec "killall -9 FreeFire" || true