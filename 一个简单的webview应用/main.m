//
//  main.m
//  一个简单的webview应用
//
//  Created by macos on 2022/11/2.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSApplication *app = [NSApplication sharedApplication];
    [app setActivationPolicy:NSApplicationActivationPolicyRegular];
    
    // 窗口大小
    NSRect rect = CGRectMake(0., 0., 600, 350);
    
    // 创建时的一些参数
    WKUserContentController *userConfiguration = [[WKUserContentController alloc] init];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    [configuration setUserContentController:userConfiguration];
    
    // 创建webview
    WKWebView *webview = [[WKWebView alloc] initWithFrame:rect configuration:configuration];
    [webview setAutoresizingMask:NSViewWidthSizable];
    
    // 加载html
//    [webview loadHTMLString:@"<h1>Hello WKWebView! This is H1 Tag</h1>" baseURL:nil];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    // 根据URL创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // WKWebView加载请求
    [webview loadRequest:request];
    
    // 创建窗口
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
    [window setTitle:@"Explore MacOS Developer For WKWebView"];
    [window center];
    [window makeKeyAndOrderFront:nil];
    [window setContentView:webview];
    
    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];

    [app run];
    return 0;
}
