//
//  SideBarViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 17/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "GlobalClass.h"

@interface SideBarViewController : UITableViewController

@property (nonatomic, strong) GlobalClass *sharedInstance;

@end

