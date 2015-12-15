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

@interface XJMessage () < XJMessageViewControllerDelegate >

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
    
    if (showingMessage && showingMessage.vc)
    {
        if (showingMessage.isMessageCompleted)
        {
            __weak typeof(self)weakSelf = self;
            [showingMessage.vc hideMessageWithCompletion:^{
                [weakSelf showMessageHandle];
            }];
        }
        else
        {
            [self showMessageHandle];
        }
    }
    else
    {
        [self showMessageHandle];
    }
}

- (void)showMessageHandle
{
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    if (keywindow != [XJMessageManager sharedInstance].presentWindow) {
        [XJMessageManager sharedInstance].mainWindow = [UIApplication sharedApplication].keyWindow;
    }
    
    XJMessageViewController *vc = [[XJMessageViewController alloc] init];
    vc.delegate = self;
    vc.messageView = self;
    self.vc = vc;
    
    [XJMessageManager sharedInstance].presentWindow.frame = [UIScreen mainScreen].bounds;
    [[XJMessageManager sharedInstance].presentWindow makeKeyAndVisible];
    [XJMessageManager sharedInstance].presentWindow.rootViewController = self.vc;
    
    [self.vc showMessage];
}

- (void)createView
{
    if (self.subviews.count > 0) return;
    NSLog(@"%f", self.frame.size.width);
    UIView *messageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    messageView.backgroundColor = [UIColor blackColor];
    [self addSubview:messageView];
}



@end
