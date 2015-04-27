//
//  HomeScreenViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 19/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "Event+Operations.h"
#import "GlobalClass.h"
#include <netdb.h>
#import "GAITrackedViewController.h"



@interface HomeScreenViewController : GAITrackedViewController

@property (weak, nonatomic) IBOutlet UIImageView *crowdFirst;
@property (weak, nonatomic) IBOutlet UIImageView *crowdSecond;
@property (strong, nonatomic) GlobalClass *sharedInstance;
@property (weak, nonatomic) IBOutlet UIView *alertView;

@end
