/*
 ** (c) apploft GmbH 2013
 */
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

// Extern constants to disable debug messages for specific classes at once
static const BOOL ENABLE_DEBUG = YES;
static const BOOL FORCE_FULL_DEBUG = NO;
static const BOOL ENABLE_DEBUG_VIEWS = NO;

#define SET_DEBUG_VIEWS(x) (((x) && ENABLE_DEBUG && ENABLE_DEBUG_VIEWS) || FORCE_FULL_DEBUG)
#define SET_DEBUG(x) (((x) && ENABLE_DEBUG) || FORCE_FULL_DEBUG)

static const BOOL DEBUG_VIEWS_ENABLED = SET_DEBUG_VIEWS(YES);

#define LOG_CONTAINER_VIEW(logLevel, ...) if ((DEBUG_CONTAINER_VIEW)) APLLog((logLevel), __VA_ARGS__);

#define DBG_VIEW_FRAME(x) if (DEBUG_VIEWS_ENABLED) { [[x layer] setBorderWidth:1.]; [[x layer] setBorderColor:[UIColor redColor].CGColor]; }
#define DBG_VIEW_FRAMEC(x, c) if (DEBUG_VIEWS_ENABLED) { [[x layer] setBorderWidth:1.]; [[x layer] setBorderColor:[UIColor c].CGColor]; }

typedef enum
{
	kAPLLogError   =  -2,
	kAPLLogWarning =  -1,
	kAPLLogInfo    =   1,
	kAPLLogDebug   =   2,
} APLLogLevel;

extern NSString *kAPLLogKey;
extern const APLLogLevel kAPLLogLevelDefault;


void APLLogv(APLLogLevel aLogLevel, NSString *aFormatString, va_list anArgumentList);
void APLLog(APLLogLevel aLogLevel, NSString *aFormatString, ...);

void APLLogError(NSString *aFormatString, ...);
void APLLogInfo(NSString *aFormatString, ...);
void APLLogWarning(NSString *aFormatString, ...);
void APLLogDebug(NSString *aFormatString, ...);

void APLLogLevelInit(void);