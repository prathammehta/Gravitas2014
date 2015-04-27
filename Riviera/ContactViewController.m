//
//  ContactViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 17/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void) viewDidLoad
{
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    CLLocationCoordinate2D location;
    location.longitude = 79.15768;
    location.latitude = 12.97239;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 1000, 1000);
    [self.mapView setRegion:viewRegion animated:YES];
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)showHideMenu:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0];
}

@end
