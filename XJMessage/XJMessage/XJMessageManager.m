//
//  XJMessageManager.m
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import "XJMessageManager.h"

@implementation XJMessageManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static XJMessageManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (UIWindow *)presentWindow
{
    if (!_presentWindow) {
        _presentWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _presentWindow.windowLevel = UIWindowLevelStatusBar - 1;
    }
    return _presentWindow;
}

- (NSMutableArray *)messageQueue {
    return _messageQueue ? : [NSMutableArray array];
}



@end
