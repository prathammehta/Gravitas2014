//
//  SportsEventsViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 25/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "SportsEventsViewController.h"

@interface SportsEventsViewController ()

@end

@implementation SportsEventsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideShowMenu:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0];
}
@end
