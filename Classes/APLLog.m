/*
 ** (c) apploft GmbH 2013
 */

#import "APLLog.h"

NSString *kAPLLogKey = @"de.apploft.APLLog";

static NSInteger setLogLevel = NSIntegerMin; // Uninitialized
const APLLogLevel kAPLLogLevelDefault = kAPLLogDebug;



void APLLogLevelInit(void) {
	if (setLogLevel == NSIntegerMin) {
		id aLogLevel = [[NSBundle mainBundle] objectForInfoDictionaryKey:kAPLLogKey];
        
		if (aLogLevel) {
			NSInteger aIntLogLevel = [aLogLevel integerValue];
			if (aIntLogLevel > kAPLLogDebug)
				aIntLogLevel = kAPLLogDebug;
			if (aIntLogLevel < kAPLLogError)
				aIntLogLevel = kAPLLogError;
			setLogLevel = aIntLogLevel;
		} else {
			setLogLevel = kAPLLogLevelDefault;
        }
	}
}

void APLLogv(APLLogLevel aLogLevel, NSString *aFormatString, va_list anArgumentList)
{
	APLLogLevelInit();
	if (aLogLevel <= setLogLevel)
	{
		NSLogv(aFormatString, anArgumentList);
	}
}

void APLLog(APLLogLevel aLogLevel, NSString *aFormatString, ...)
{
	APLLogLevelInit();
	if (aLogLevel <= setLogLevel)
	{	
		va_list anArgumentList;
		va_start(anArgumentList, aFormatString);
		NSLogv(aFormatString, anArgumentList);
		va_end(anArgumentList);
	}
}

void APLLogError(NSString *aFormatString, ...)
{
	APLLogLevelInit();
	if (kAPLLogError <= setLogLevel)
	{
		va_list anArgumentList;
		va_start(anArgumentList, aFormatString);
		NSLogv(aFormatString, anArgumentList);
		va_end(anArgumentList);
	}
}

void APLLogWarning(NSString *aFormatString, ...)
{
	APLLogLevelInit();
	if (kAPLLogWarning <= setLogLevel)
	{
		va_list anArgumentList;
		va_start(anArgumentList, aFormatString);
		NSLogv(aFormatString, anArgumentList);
		va_end(anArgumentList);
	}
}

void APLLogInfo(NSString *aFormatString, ...)
{
	APLLogLevelInit();
	if (kAPLLogInfo <= setLogLevel)
	{
		va_list anArgumentList;
		va_start(anArgumentList, aFormatString);
		NSLogv(aFormatString, anArgumentList);
		va_end(anArgumentList);
	}
}

void APLLogDebug(NSString *aFormatString, ...)
{
	APLLogLevelInit();
	if (kAPLLogDebug <= setLogLevel)
	{
		va_list anArgumentList;
		va_start(anArgumentList, aFormatString);
		NSLogv(aFormatString, anArgumentList);
		va_end(anArgumentList);
	}
}
