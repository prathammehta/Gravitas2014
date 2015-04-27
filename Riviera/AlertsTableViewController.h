//
//  AlertsTableViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 04/02/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <netdb.h>

@interface AlertsTableViewController : UITableViewController

@property (nonatomic) BOOL dataRecived;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSMutableArray *alerts;

@end
