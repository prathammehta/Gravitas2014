//
//  EventsViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#include<unistd.h> 
#include<netdb.h>
#import "GlobalClass.h"
#import "Event+Operations.h"
#import "UIImage+ImageEffects.h"
#import "SWRevealViewController.h"

@interface EventsViewController : UIViewController

@property (nonatomic, strong) GlobalClass *sharedInstance;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UIButton *showHideMenu;
@property (weak, nonatomic) IBOutlet UILabel *noNetworkLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (nonatomic) NSInteger day;

@end
