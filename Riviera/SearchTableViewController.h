//
//  SearchTableViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 31/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "GlobalClass.h"
#import "Event.h"

@interface SearchTableViewController : CoreDataTableViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSString *startsWith;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) Event *event;
 
@end
