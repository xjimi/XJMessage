//
//  ViewController.m
//  XJMessage
//
//  Created by XJIMI on 2015/12/11.
//  Copyright © 2015年 XJIMI. All rights reserved.
//

#import "ViewController.h"
#import "XJMessage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [XJMessage showMessageWithTitle:@"title" subtitle:@"subtitle"];
}

@end
