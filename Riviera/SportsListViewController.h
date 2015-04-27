//
//  SportsListViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 25/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface SportsListViewController : UITableViewController

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *dates;
@property (nonatomic, strong) NSArray *venues;
 
@end
