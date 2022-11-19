//
//  main.m
//  使用NSPopover来显示状态栏应用的内部状态
//
//  Created by macos on 2022/11/4.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MyViewController : NSViewController

@end

@implementation MyViewController

@end

@interface App : NSObject {
    
}
@property (nonatomic, strong) NSPopover *popover;
@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) NSViewController *viewController;
@property (nonatomic, strong) NSEvent *event;
@end


@implementation App

- (void)initApp {
    NSApplication *app = [NSApplication sharedApplication];
    [app setActivationPolicy:NSApplicationActivationPolicyAccessory];
    
    // 创建 NSStatusItem
    NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem = statusItem;
    // 加载Downloads下的carrot.png文件
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Downloads/carrot.png"];
    NSLog(@"%@", path);
    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:path];
    [statusItem.button setImage:icon];
 
    [statusItem.button setTarget:self];
    [statusItem.button setAction:@selector(onClickForStatusItem:)];
    
    self.event = [NSEvent addGlobalMonitorForEventsMatchingMask:(NSEventMaskLeftMouseDown | NSEventMaskRightMouseDown | NSEventMaskKeyUp) handler:^(NSEvent* event) {
        if (self->_popover.shown == YES) {
            NSLog(@"关闭popover");
            [self->_popover close];
        } else {
            NSLog(@"popover已经关闭");
        }
    }];
    
    NSRunningApplication *current_app = [NSRunningApplication currentApplication];
    [current_app activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    
    [app run];
}
- (void)onClickForStatusItem:(NSButton *)btn {
    NSLog(@"点击事件");
    NSRect statusRect = [btn bounds];
    
    // 创建 NSPopover
    NSPopover *popover = [[NSPopover alloc] init];
    _popover = popover;
    NSViewController *controller = [[NSViewController alloc] initWithNibName:nil bundle:nil];
    self.viewController = controller;
    controller.view = [[NSView alloc] init];
    popover.contentViewController = controller;
    // 点击其他控件时就会关闭NSPopover
    [popover setBehavior:NSPopoverBehaviorTransient];
    [popover setAnimates:YES];
    [popover showRelativeToRect:statusRect ofView:btn preferredEdge:NSRectEdgeMaxY];
    
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    App *s = [App new];
    [s initApp];
    return 0;
}
