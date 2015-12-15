//
//  XJMessageViewController.h
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJMessage.h"

@interface XJMessageViewController : UIViewController

@property (nonatomic, weak) XJMessage *messageView;

- (void)hideAlertWithCompletion:(void(^)(void))completion;

@end
