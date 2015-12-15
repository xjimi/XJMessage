//
//  XJMessage.h
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PortraitW MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define PortraitH MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)

@interface XJMessage : UIView

@property (nonatomic, getter=isMessageCompleted) BOOL messageCompleted;

- (void)createView;

+ (void)showMessageWithTitle:(NSString *)title
                    subtitle:(NSString *)subtitle;

@end
