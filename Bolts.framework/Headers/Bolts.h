//Jasdeep Singh Dhadda ,Jasdeep Singh Bhadhan ,Jasjeet Kaur ,Mandeep kaur,Lovepreet Kaur

#import <Bolts/BoltsVersion.h>
#import <Bolts/BFCancellationToken.h>
#import <Bolts/BFCancellationTokenRegistration.h>
#import <Bolts/BFCancellationTokenSource.h>
#import <Bolts/BFExecutor.h>
#import <Bolts/BFTask.h>
#import <Bolts/BFTaskCompletionSource.h>

#if __has_include(<Bolts/BFAppLink.h>) && TARGET_OS_IPHONE
#import <Bolts/BFAppLinkNavigation.h>
#import <Bolts/BFAppLink.h>
#import <Bolts/BFAppLinkResolving.h>
#import <Bolts/BFAppLinkReturnToRefererController.h>
#import <Bolts/BFAppLinkReturnToRefererView.h>
#import <Bolts/BFAppLinkTarget.h>
#import <Bolts/BFMeasurementEvent.h>
#import <Bolts/BFURL.h>
#import <Bolts/BFWebViewAppLinkResolver.h>
#endif

/*! @abstract 80175001: There were multiple errors. */
extern NSInteger const kBFMultipleErrorsError;

@interface Bolts : NSObject

/*!
 Returns the version of the Bolts Framework as an NSString.
 @returns The NSString representation of the current version.
 */
+ (NSString *)version;

@end
