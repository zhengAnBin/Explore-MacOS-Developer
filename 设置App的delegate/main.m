//
//  main.m
//  设置App的delegate
//
//  Created by macos on 2022/11/20.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>

@interface MyNSApplicationDelegate : NSObject<NSApplicationDelegate>

@end

@implementation MyNSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSLog(@"应用程序完成启动");
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSApplication *app = [NSApplication sharedApplication];
    [app setActivationPolicy:NSApplicationActivationPolicyRegular];
    MyNSApplicationDelegate * delegate = [MyNSApplicationDelegate new];
    [app setDelegate:delegate];
    
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
    [webview loadHTMLString:@"<h1>Add Delegate In App</h1>" baseURL:nil];
 
    // 创建窗口
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
    [window setTitle:@"App Delegate"];
    [window center];
    [window makeKeyAndOrderFront:nil];
    [window setContentView:webview];
    
    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];

    [app run];
    return 0;
}
