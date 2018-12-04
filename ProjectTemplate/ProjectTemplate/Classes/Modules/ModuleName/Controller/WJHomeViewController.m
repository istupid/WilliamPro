//
//  WJHomeViewController.m
//  ProjectTemplate
//
//  Created by William on 2018/12/4.
//  Copyright © 2018 William. All rights reserved.
//

#import "WJHomeViewController.h"
#import "UIGestureRecognizer+Block.h"

@interface WJHomeViewController ()

@end

@implementation WJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIGestureRecognizer *tap = [UITapGestureRecognizer wj_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        NSLog(@"%@", gestureRecognizer);
    }];
    
    [self.view addGestureRecognizer:tap];
}


@end
