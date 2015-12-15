//
//  XJMessageViewController.m
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import "XJMessageViewController.h"

@interface XJMessageViewController ()

@property (nonatomic, strong) UIButton *bgView;

@end

@implementation XJMessageViewController

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createBackgroundView];
    [self createMessageView];
}

- (void)createBackgroundView
{
    self.bgView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, PortraitW, PortraitH)];
    self.bgView.backgroundColor = [UIColor blackColor];
    [self.bgView addTarget:self action:@selector(action_tapBgView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bgView];
}

- (void)createMessageView
{
    [self.message createView];
    [self.view addSubview:self.message];
}

- (void)action_tapBgView
{
    if ([self.delegate respondsToSelector:@selector(messageViewBackgroundTouched)]) {
        [self.delegate messageViewBackgroundTouched];
    }
}

- (void)hideMessageWithCompletion:(void(^)(void))completion
{
    self.message.messageCompleted = NO;
    
    CGRect messageViewFrame = self.message.frame;
    messageViewFrame.origin.y = PortraitH;
    self.message.alpha = 1.0f;
    [UIView animateWithDuration:.4
                          delay:0
                        options:(7 << 16)
                     animations:^{
                         
                         self.bgView.alpha = 0.0f;
                         self.message.frame = messageViewFrame;
                         
                     } completion:^(BOOL finished) {
                         
                         if (completion) completion();
                         
                         self.message.messageCompleted = YES;
                         
                     }];
}


- (void)showMessage
{
    self.message.messageCompleted = NO;
    
    NSLog(@"showMessage");

    self.bgView.alpha = 0.0f;
    self.message.alpha = 0.0f;
    CGRect messageViewFrame = self.message.frame;
    messageViewFrame.origin.y = PortraitH - messageViewFrame.size.height;
    self.message.alpha = 1.0f;
    [UIView animateWithDuration:.4
                          delay:0
                        options:(7 << 16)
                     animations:^{
                         
                         self.bgView.alpha = 0.7f;
                         self.message.frame = messageViewFrame;
                         
                     } completion:^(BOOL finished) {
                         
                         self.message.messageCompleted = YES;
                         
                     }];

}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
