//
//  XJMessageViewController.m
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import "XJMessageViewController.h"


@implementation XJMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createMessageView];
}

- (void)hideMessageWithCompletion:(void(^)(void))completion
{
    self.messageView.messageCompleted = NO;
    
    CGFloat duration = 0.2;
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.messageView.alpha = 0;
    } completion:^(BOOL finished) {

        if (completion) {
            completion();
        }
    }];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.messageView.transform = CGAffineTransformMakeScale(0.4, 0.4);
    } completion:^(BOOL finished) {
        self.messageView.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)createMessageView
{
    [self.messageView createView];
    [self.view addSubview:self.messageView];
}

- (void)showMessage
{
    self.messageView.messageCompleted = NO;
    
    NSLog(@"showMessage");

    self.messageView.alpha = 0;
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.messageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        self.messageView.messageCompleted = YES;
    }];

}



@end
