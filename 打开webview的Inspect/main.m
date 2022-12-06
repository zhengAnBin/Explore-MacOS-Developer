//
//  main.m
//  打开webview的Inspect
//
//  Created by macos on 2022/12/6.
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
    // 允许右键 Inspect Element 打开控制台
    WKPreferences *preferences = [[WKPreferences alloc] init];
    [preferences setValue:@YES forKey:@"developerExtrasEnabled"];
    [configuration setPreferences:preferences];
    
    // 创建webview
    WKWebView *webview = [[WKWebView alloc] initWithFrame:rect configuration:configuration];
    [webview setAutoresizingMask:NSViewWidthSizable];
    
    [webview loadHTMLString:@"<button>点击按钮</button>" baseURL:nil];
    
    // 创建窗口
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
    [window setTitle:@"Inspect Element"];
    [window center];
    [window makeKeyAndOrderFront:nil];
    [window setContentView:webview];
    
    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    
    [app run];
    return 0;
}
