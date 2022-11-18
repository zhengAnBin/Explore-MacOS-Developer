//
//  MyWebView.h
//  webview-OC与JS通讯
//
//  Created by macos on 2022/11/18.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyWebView : NSViewController<WKScriptMessageHandler>
- (void)render;
@end

NS_ASSUME_NONNULL_END
