//
//  main.m
//  Explore MacOS Developer
//
//  Created by macos on 2022/11/2.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSApplication *app = [NSApplication sharedApplication];
    [app setActivationPolicy:NSApplicationActivationPolicyRegular];
    NSRect rect = CGRectMake(0., 0., 600, 350);
    
    NSWindow *window = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
    
    [window setTitle:@"Explore MacOS Developer"];
    [window center];
    [window makeKeyAndOrderFront:nil];
    
    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    
    [app run];
    return 0;
}
