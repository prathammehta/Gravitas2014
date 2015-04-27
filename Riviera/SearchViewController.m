//
//  SearchViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 31/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.revealViewController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHideMenu:(UIButton *)sender
{
    [self.view endEditing:YES];
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0.0];
}

- (void) revealControllerPanGestureEnded:(SWRevealViewController *)revealController
{
    [self.view endEditing:YES];
}



@end
