//
//  XJMessageManager.h
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XJMessageManager : NSObject

@property (nonatomic, strong) UIWindow *presentWindow;
@property (nonatomic, weak)   UIWindow *mainWindow;
@property (nonatomic, strong) NSMutableArray *messageQueue;

+ (instancetype)sharedInstance;

@end
