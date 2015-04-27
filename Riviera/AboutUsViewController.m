//
//  AboutUsViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 17/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Current identifier: %@", [[NSBundle mainBundle] bundleIdentifier]);
    self.showHideMenu.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    [self.scrollVIew setContentSize:CGSizeMake(320, 540)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHideMenuPressed:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0];
}

@end
