//
//  EventsCDTVC.h
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "GlobalClass.h"
#import "Event+Operations.h"

@interface EventsCDTVC : CoreDataTableViewController

@property (nonatomic,strong) NSManagedObjectContext *context;
@property (nonatomic) NSInteger day;
@property (nonatomic, strong) Event *event;

@end

