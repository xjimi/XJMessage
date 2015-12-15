//
//  XJMessage.m
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import "XJMessage.h"
#import "XJMessageManager.h"
#import "XJMessageViewController.h"

@interface XJMessage ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, weak) XJMessageViewController *vc;
@property (nonatomic, getter=isDismissWhenTouchBackground) BOOL dismissWhenTouchBackground;


@end

@implementation XJMessage

+ (void)showMessageWithTitle:(NSString *)title
                    subtitle:(NSString *)subtitle
{
    XJMessage *message = [XJMessage new];
    [message configureMessageViewWtihTitle:title subtitle:subtitle];
}

- (void)configureMessageViewWtihTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    self.title = title;
    self.subtitle = subtitle;
    [[XJMessageManager sharedInstance].messageQueue addObject:self];
    [self showMessage];
}

- (void)showMessage
{
    NSInteger count = [XJMessageManager sharedInstance].messageQueue.count;
    XJMessage *showingMessage = nil;
    if (count > 1) {
        NSInteger index = [[XJMessageManager sharedInstance].messageQueue indexOfObject:self];
        showingMessage = [XJMessageManager sharedInstance].messageQueue[index - 1];
    }
    
    if (showingMessage && showingMessage.vc) {
        if (showingMessage.isMessageCompleted) {
            [showingMessage.vc hideAlertWithCompletion:^{
                [self showMessageHandle];
            }];
        } else {
            [self showMessageHandle];
        }
    } else {
        [self showMessageHandle];
    }
}

- (void)showMessageHandle
{
    
}

@end
