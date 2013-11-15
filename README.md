APLLog
=========

Console logger supporting different log levels for different configurations. Logs debug output to console as alternative to NSLog. Supports log levels debug, info, warning, error.

## Installation
Install via cocoapods by adding this to your Podfile:

	pod "APLLog", "~> 0.0.1"

## Usage
Include header: 

	#import "APLLog.h"
	
Log levels are configurable for each configuration via custom build setting:

* add key `de.apploft.APLLog` = `${LOG_LEVEL}` to your project info.plist
* add custom build setting `LOG_LEVEL` with values from -2 (= errors only) to 2 (= debug)

Use `APLLog(kAPLLogDebug, @"your output")` or `APLLogDebug(@"your output")` or `APLLogWarning(@"your output")` etc. in your code.