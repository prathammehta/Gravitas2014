//
//  RulesAndRegulationsViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 25/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "RulesAndRegulationsViewController.h"

@interface RulesAndRegulationsViewController ()

@end

@implementation RulesAndRegulationsViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)donePressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
