# Maintainer: WeirdTreeThing <bradyn127@protonmail.com>
pkgname=eupnea-utils
pkgver=1.0
pkgrel=1
pkgdesc="Various scripts and utilities for EupneaOS and Depthboot."
arch=(any)
url="https://eupnea-linux.github.io/"
license=('GPL')

prepare() {
	git clone https://github.com/eupnea-linux/audio-scripts
	git clone https://github.com/eupnea-linux/postinstall-scripts
}

package () {
	mkdir -p $pkgdir/etc/eupnea
	cp -r $srcdir/postinstall-scripts/configs/device-specific $pkgdir/etc/eupnea
	cp -r $srcdir/audio-scripts/configs/audio $pkgdir/etc/eupnea

	rm -r $srcdir/postinstall-scripts/{configs,LICENSE,README.md,.gitignore,.git}
	mkdir -p $pkgdir/usr/bin
	install -Dm 755 $srcdir/postinstall-scripts/* $pkgdir/usr/bin
	install -Dm 755 $srcdir/audio-scripts/setup-audio $pkgdir/usr/bin
	install -Dm 755 $srcdir/audio-scripts/functions.py $pkgdir/usr/bin
}
