#import <Cordova/CDV.h>
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"
    
@interface BonjourServer : CDVPlugin {
    GCDWebServer* _webServer;

    dispatch_semaphore_t serverWait;
    NSString *serverResponse;
}

- (void) startServer:(CDVInvokedUrlCommand *)command;
- (void) stopServer:(CDVInvokedUrlCommand *)command;
- (void) setRequestHandler:(CDVInvokedUrlCommand *)command;
- (void) setResponseString:(CDVInvokedUrlCommand *)command;
- (void) sendResponse:(CDVInvokedUrlCommand *)command;

@end