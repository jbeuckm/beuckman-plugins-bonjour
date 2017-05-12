#import <Cordova/CDV.h>
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"
    
@interface BonjourServer : CDVPlugin {
    
      GCDWebServer* _webServer;
}

- (void) echo:(CDVInvokedUrlCommand *)command;

@end