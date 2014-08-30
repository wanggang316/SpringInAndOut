//
//  WGViewController.m
//  DynamicMoving
//
//  Created by 王刚 on 14/8/29.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGViewController.h"

@interface WGViewController ()<UICollisionBehaviorDelegate>

@property (strong, nonatomic) UIDynamicAnimator* animator;

@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) UIButton *btn1;
@property (strong, nonatomic) UIButton *btn2;


@property (strong, nonatomic) UIView *bgView;

@end

@implementation WGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bgView = [[UIView alloc]initWithFrame:self.view.frame];
    self.bgView.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler:)];
    [self.bgView addGestureRecognizer:tapGesture];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(35, 1100, 60, 60)];
    self.btn.backgroundColor = [UIColor purpleColor];
    self.btn.layer.cornerRadius = 30;
    self.btn.layer.shadowColor = [UIColor blackColor].CGColor;
    self.btn.layer.shadowOffset = CGSizeMake(2, 2);
    self.btn.layer.shadowOpacity = 0.5;
    self.btn.layer.shadowRadius = 8;
    [self.bgView addSubview:self.btn];
    
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(130, 950, 60, 60)];
    self.btn1.backgroundColor = [UIColor orangeColor];
    self.btn1.layer.cornerRadius = 30;
    self.btn1.layer.shadowColor = [UIColor blackColor].CGColor;
    self.btn1.layer.shadowOffset = CGSizeMake(2, 2);
    self.btn1.layer.shadowOpacity = 0.5;
    self.btn1.layer.shadowRadius = 8;
    [self.bgView addSubview:self.btn1];
    
    
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(225, 800, 60, 60)];
    self.btn2.backgroundColor = [UIColor cyanColor];
    self.btn2.layer.cornerRadius = 30;
    self.btn2.layer.shadowColor = [UIColor blackColor].CGColor;
    self.btn2.layer.shadowOffset = CGSizeMake(2, 2);
    self.btn2.layer.shadowOpacity = 0.5;
    self.btn2.layer.shadowRadius = 8;
    [self.bgView addSubview:self.btn2];
    
    
    
    
}
- (IBAction)show:(id)sender {
    
    self.bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [self.view addSubview:self.bgView];
    [UIView animateWithDuration:0.3
                          delay:0.0
         usingSpringWithDamping:.8
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
                         
                         self.btn.frame = CGRectMake(35, 200, 60, 60);
                         self.btn1.frame = CGRectMake(130, 200, 60, 60);
                         self.btn2.frame = CGRectMake(225, 200, 60, 60);
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
    
}


- (void)tapHandler:(UIButton *)sender {
    
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.0
                                 options:UIViewAnimationOptionCurveLinear | UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  
                                  self.bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
                                  
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:1/3.0
                                                                animations:^{
                                                                    self.btn.frame = CGRectMake(35, 130, 60, 60);
                                                                    self.btn1.frame = CGRectMake(130, 120, 60, 60);
                                                                    self.btn2.frame = CGRectMake(225, 130, 60, 60);
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:1/3.0
                                                          relativeDuration:2/3.0
                                                                animations:^{
                                                                    self.btn.frame = CGRectMake(35, 1200, 60, 60);
                                                                    self.btn1.frame = CGRectMake(130, 1500, 60, 60);
                                                                    self.btn2.frame = CGRectMake(225, 1200, 60, 60);
                                                                }];
                                self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1.0];
                                  
                              }
                              completion:^(BOOL finished) {
                                  [self.bgView removeFromSuperview];
                              }];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
