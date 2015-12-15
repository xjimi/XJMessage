//
//  XJMessage.h
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJMessage : UIView

@property (nonatomic, getter=isMessageCompleted) BOOL messageCompleted;

+ (void)showMessageWithTitle:(NSString *)title
                    subtitle:(NSString *)subtitle;

@end
