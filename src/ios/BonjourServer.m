#import "BonjourServer.h"

@implementation BonjourServer
    
- (void)pluginInitialize {
    _webServer = [[GCDWebServer alloc] init];
}

- (void) startServer:(CDVInvokedUrlCommand *)command {
    
    NSString* port = [command.arguments objectAtIndex:0];        
    NSString* bonjourName = [command.arguments objectAtIndex:1];        
      
  [_webServer addDefaultHandlerForMethod:@"GET"
                            requestClass:[GCDWebServerRequest class]
                            processBlock:^GCDWebServerResponse *(GCDWebServerRequest* request) {
    
    return [GCDWebServerDataResponse responseWithHTML:serverResponse];
    
  }];

  [_webServer startWithPort:[port intValue] bonjourName:bonjourName];

  NSLog(@"Visit %@ in your web browser", _webServer.serverURL);
    
  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}


- (void) setRequestHandler:(CDVInvokedUrlCommand *)command {
  
  // Add a handler to respond to GET requests on any URL
  [_webServer addDefaultHandlerForMethod:@"GET"
                            requestClass:[GCDWebServerRequest class]
                            processBlock:^GCDWebServerResponse *(GCDWebServerRequest* request) {
    
//                                dispatch_semaphore_wait(serverWait, DISPATCH_TIME_FOREVER);
                                
    return [GCDWebServerDataResponse responseWithHTML:@"<html><body><p>Hello World</p></body></html>"];
//    return [GCDWebServerDataResponse responseWithHTML:serverResponse];
    
  }];
    
}

- (void) setResponseString:(CDVInvokedUrlCommand *)command {
    
    serverResponse = [command.arguments objectAtIndex:0];

}


- (void) sendResponse:(CDVInvokedUrlCommand *)command {

    serverResponse = [command.arguments objectAtIndex:0];

//    dispatch_semaphore_signal(dispatch_semaphore_wait);
}

- (void) stopServer:(CDVInvokedUrlCommand *)command {
    [_webServer stop];
}

@end