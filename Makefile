version=$(shell node -e "console.log(require('./package.json').version)")

all:
	coffee -o dst -c src/index.coffee
	coffee -o dst -c src/msview.coffee
	jade src/index.jade -o dst -P
	cp src/msview.css dst
	cp package.json dst

pw:
	electron-packager dst msview --platform=win32 --arch=ia32 --version=0.35.1 --overwrite --out=release
	if [ -e msview-$(version).zip ] ; then rm msview-$(version).zip ; fi
	cd release && zip -r ../msview-$(version).zip *-win32-*
