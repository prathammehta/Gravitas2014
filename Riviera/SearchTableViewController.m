//
//  SearchTableViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 31/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *) startsWith
{
    if(!_startsWith)
    {
        _startsWith = @"Pratham is awesome";
    }
    return _startsWith;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];
    self.searchBar.delegate = self;
    GlobalClass *sharedInstance = [GlobalClass sharedInstance];
    self.context = sharedInstance.context;
    [self updateFetchResultsController];
    //[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissEventDatails) name:@"eventDetailsViewDonePressed" object:nil];
}

- (void) dismissEventDatails
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) updateFetchResultsController
{
    if(self.context)
    {
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Event"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector: @selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[c] %@", self.startsWith];
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:self.context
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
        NSLog(@"Count of objects fetched:%lu",(unsigned long)[self.fetchedResultsController.fetchedObjects count]);
    }
    else
    {
        self.fetchedResultsController = nil;
    }
    [self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"searchCell"];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    Event *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = event.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Day: %@",event.day];
    return cell;
}

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.startsWith = searchText;
    [self updateFetchResultsController];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.event =  [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"eventDisplayFromSearch" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"eventDisplayFromSearch"])
    {
        [segue.destinationViewController performSelector:@selector(setEvent:) withObject:self.event];
    }
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.searchBar resignFirstResponder];
}
@end
