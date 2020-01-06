//
//  ShareViewController.m
//  ShareExtension
//
//  Created by Justin Joy on 06/01/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ShareViewController.h"
#import <React/RCTBridge.h>
#import <React/RCTRootView.h>
//#import <React/RCTBridgeDelegate.h>
#import <React/RCTBundleURLProvider.h>

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)loadView {
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"ShareExtension"
                                            initialProperties:nil];
  self.view = rootView;
}

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
