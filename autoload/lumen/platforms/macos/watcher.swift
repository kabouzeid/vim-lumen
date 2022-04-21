#!/usr/bin/env swift

// Based on https://github.com/bouk/dark-mode-notify/blob/main/dark-mode-notify.swift (MIT license)
// Which itself is based on https://github.com/mnewt/dotemacs/blob/master/bin/dark-mode-notifier.swift (Unlicense license)


import Cocoa

func notify() {
	let isDark = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
	if isDark {
		print("Dark")
	} else {
		print("Light")
	}
}

DistributedNotificationCenter.default.addObserver(
	forName: Notification.Name("AppleInterfaceThemeChangedNotification"),
	object: nil,
	queue: nil) { (notification) in
		notify()
}

NSApplication.shared.run()
