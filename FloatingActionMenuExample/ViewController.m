//
//  ViewController.m
//  FloatingActionMenuExample
//
//  Created by KeithEllis on 14/12/11.
//  Copyright (c) 2014 keith. All rights reserved.
//

#import "ViewController.h"

#define ToolbarHeight 54.f

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* items = @[ @{ FloatingActionMenuImage : [UIImage imageNamed:@"Item01"],
                           FloatingActionMenuText : @"Play game",
                           FloatingActionMenuColor : [UIColor colorWithRed:0.47 green:0.33 blue:0.28 alpha:1] },
                        @{ FloatingActionMenuImage : [UIImage imageNamed:@"Item02"],
                           FloatingActionMenuText : @"Volume",
                           FloatingActionMenuColor : [UIColor colorWithRed:1 green:0.41 blue:0.22 alpha:1] },
                        @{ FloatingActionMenuImage : [UIImage imageNamed:@"Item03"],
                           FloatingActionMenuText : @"Video player",
                           FloatingActionMenuColor : [UIColor colorWithRed:0.61 green:0.15 blue:0.69 alpha:1] },
                        @{ FloatingActionMenuImage : [UIImage imageNamed:@"Item04"],
                           FloatingActionMenuText : @"Keyboard",
                           FloatingActionMenuColor : [UIColor colorWithRed:0 green:0.73 blue:0.82 alpha:1] } ];
    FloatingActionMenu* actionMenu = [FloatingActionMenu createMenuInViewController:self
                                                                              image:[UIImage imageNamed:@"Main"]
                                                                      expandedImage:[UIImage imageNamed:@"MainExpanded"]
                                                                          titleText:@"Something"
                                                                              color:[UIColor colorWithRed:0.91 green:0.12 blue:0.39 alpha:1]
                                                                      expandedItems:items];
    actionMenu.delegate = self;
    
    CGFloat width = MAX(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    CGRect rect = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), width, [self statusBarHeight] + ToolbarHeight);
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor colorWithRed:0.25 green:0.32 blue:0.71 alpha:1];
    
    UIBezierPath* shadowPath = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.masksToBounds = NO;
    view.layer.shadowColor = [UIColor colorWithWhite:0.2 alpha:0.8].CGColor;
    view.layer.shadowOffset = CGSizeMake(0.f, 1.0f);
    view.layer.shadowOpacity = 0.5f;
    view.layer.shadowPath = shadowPath.CGPath;
    
    rect = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), width, [self statusBarHeight]);
    UIView *statusBarView = [[UIView alloc] initWithFrame:rect];
    statusBarView.backgroundColor = [UIColor colorWithRed:0.19 green:0.25 blue:0.62 alpha:1];
    
    [self.view addSubview:view];
    [self.view addSubview:statusBarView];
}

- (CGFloat)statusBarHeight
{
    return MIN([UIApplication sharedApplication].statusBarFrame.size.height,
               [UIApplication sharedApplication].statusBarFrame.size.width);
}

#pragma mark - FloatingActionMenuDelegate

- (void)didSelectItemAtIndex:(NSUInteger)index
{
    NSLog(@"Select submenu item at index %zd", index);
}

- (void)didSelectMainItem
{
    NSLog(@"Select main item");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
