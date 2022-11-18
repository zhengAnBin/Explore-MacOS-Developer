//
//  main.m
//  webview-OC与JS通讯
//
//  Created by macos on 2022/11/16.
//

#import <Foundation/Foundation.h>
#import "MyWebView.h"
//#import <AppKit/AppKit.h>
//#import <WebKit/WebKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    MyWebView *webview = [[MyWebView alloc] init];
    [webview render];
    return 0;
}
