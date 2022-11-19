//
//  MyWebView.m
//  webview-OC与JS通讯
//
//  Created by macos on 2022/11/18.
//

#import "MyWebView.h"

@implementation MyWebView

- (void)render {
    NSApplication *app = [NSApplication sharedApplication];
    [app setActivationPolicy:NSApplicationActivationPolicyRegular];
    
    NSRect rect = CGRectMake(0., 0., 600, 350);
  
    WKUserContentController *userConfiguration = [[WKUserContentController alloc] init];
    [userConfiguration addScriptMessageHandler:self name:@"handler_oc"];
        
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    [configuration setUserContentController:userConfiguration];
    
    WKWebView *webview = [[WKWebView alloc] initWithFrame:rect configuration:configuration];
    [webview setAutoresizingMask:NSViewWidthSizable];

    // 执行js脚本
//    [webview evaluateJavaScript:@"" completionHandler:^(id _Nullable result, NSError *error) {
//        if (error) {
//            // 如果document.body.appendChild(h1)后面不加上toString()的话，就会发生一下错误，因为appendChild返回的是一个don对象，这种类型不被OC支持。
//            // Error Domain=WKErrorDomain Code=5 "JavaScript execution returned a result of an unsupported type" UserInfo={NSLocalizedDescription=JavaScript execution returned a result of an unsupported type}
//            NSLog(@"发生错误：%@", error);
//        } else {
//            NSLog(@"%@", result);
//            NSLog(@"执行完毕");
//        }
//    }];
    
    [webview loadHTMLString:@"<button onClick='clickButton()' id='btn'>点击按钮</button> \
     <script> \
        function clickButton() { \
            const btn = document.getElementById('btn'); \
            window.webkit.messageHandlers.handler_oc.postMessage({ \
                name: 'handler_oc', \
                type: 'click', \
                data: '123456789' \
            }); \
        }\
     </script>" baseURL:nil];
    
    // 创建窗口
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
    [window setTitle:@"OC与JS通讯"];
    [window center];
    [window makeKeyAndOrderFront:nil];
    [window setContentView:webview];
    
    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];

    [app run];
}

//@interface YJBaseVC () <WKScriptMessageHandler>

#pragma mark
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"方法名:%@", message.name);
    NSLog(@"参数:%@", message.body);
    // 方法名
//    NSString *methods = [NSString stringWithFormat:@"%@:", message.name];
//    SEL selector = NSSelectorFromString(methods);
    // 调用方法
//    if ([self respondsToSelector:selector]) {
//        [self performSelector:selector withObject:message.body];
//    } else {
//        NSLog(@"未实行方法：%@", methods);
//    }
}
@end
