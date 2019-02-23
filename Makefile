APPNAME = SampleApp
XCODE = /Applications/Xcode.app/Contents/Developer
SOURCES = $(wildcard *.m)

.PHONY: all clean start-sim

all : ${APPNAME}.app

${APPNAME} : $(SOURCES)  
	${XCODE}/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang \
	-x objective-c \
	-arch x86_64 \
	-std=gnu99 \
	-fobjc-arc \
	-isysroot ${XCODE}/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk \
	-fobjc-abi-version=2 \
	-mios-simulator-version-min=6.0 \
	-Xlinker -objc_abi_version -Xlinker 2 \
	-fobjc-link-runtime \
	-framework CoreGraphics -framework UIKit -framework Foundation \
	*.m -o ${APPNAME}

${APPNAME}.app : ${APPNAME}
	mkdir -p ${APPNAME}.app
	cp ${APPNAME} ${APPNAME}.app/
	cp Info.plist ${APPNAME}.app/
	cp AppIcon.png ${APPNAME}.app/

start-sim:
	open ${XCODE}/Applications/Simulator.app

run: ${APPNAME}.app 
	xcrun simctl install booted ${APPNAME}.app

clean:
	rm -rf ${APPNAME} ${APPNAME}.app
