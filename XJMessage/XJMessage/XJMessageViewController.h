//
//  XJMessageViewController.h
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJMessage.h"

@class XJMessageViewController;

@protocol XJMessageViewControllerDelegate <NSObject>

@optional
- (void)messageViewBackgroundTouched;

@end

@interface XJMessageViewController : UIViewController

@property (nonatomic, weak) XJMessage *messageView;
@property (nonatomic, weak) id < XJMessageViewControllerDelegate > delegate;


- (void)showMessage;

- (void)hideMessageWithCompletion:(void(^)(void))completion;

@end
