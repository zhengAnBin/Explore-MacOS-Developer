//
//  main.m
//  objective-c runtime
//
//  Created by macos on 2022/12/8.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    Class numberClass = objc_getClass("NSNumber");
    SEL numberWithInt = sel_registerName("numberWithInt:");
    NSNumber *number = ((NSNumber *(*)(id, SEL, int))objc_msgSend)(numberClass, numberWithInt, 3);
//    NSNumber *number = objc_msgSend(numberClass, numberWithInt, 3);
    SEL intValue = sel_registerName("intValue");
    int *value = ((int *(*)(id, SEL))objc_msgSend)(number, intValue);
    // int value = objc_msgSend(number, intValue);
    NSLog(@"%d", value);
    return 0;
}
