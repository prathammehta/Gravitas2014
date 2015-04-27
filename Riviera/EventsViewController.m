//
//  EventsViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sharedInstance = [GlobalClass sharedInstance];
    self.showHideMenu.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.view.opaque = NO;
    self.dayLabel.text = [NSString stringWithFormat:@"Day %d", self.sharedInstance.eventDaySelected];
    [self isNetworkAvailable];
}

- (IBAction)showHideMenuPressed:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0.0];
}

-(void)isNetworkAvailable
{
    char *hostname;
    struct hostent *hostinfo;
    hostname = "google.com";
    hostinfo = gethostbyname(hostname);
    if (hostinfo == NULL)
    {
        NSLog(@"-> no connection!\n");
        self.noNetworkLabel.hidden = NO;
    }
    else
    {
        NSLog(@"-> connection established!\n");
        self.noNetworkLabel.hidden = YES;
    }
}


@end
