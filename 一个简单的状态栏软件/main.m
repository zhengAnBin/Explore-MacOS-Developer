//
//  main.m
//  一个简单的状态栏软件
//
//  Created by macos on 2022/11/3.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSApplication *app = [NSApplication sharedApplication];
    [app setActivationPolicy:NSApplicationActivationPolicyAccessory];
    
    // 创建statusBar
    NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    // 加载Downloads下的carrot.png文件
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Downloads/carrot.png"];
    NSLog(@"%@", path);
    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:path];
    [statusItem.button setImage:icon];

    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    
    [app run];
    return 0;
}
