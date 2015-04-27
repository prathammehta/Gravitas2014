//
//  EventsCDTVC.m
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "EventsCDTVC.h"

@interface EventsCDTVC ()

@end

@implementation EventsCDTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    GlobalClass *sharedInstance = [GlobalClass sharedInstance];
    self.context = sharedInstance.context;
    self.day = sharedInstance.eventDaySelected;
    [self performSetup];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissEventDatails) name:@"eventDetailsViewDonePressed" object:nil];
}

- (void) dismissEventDatails
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) performSetup
{
    if(self.context)
    {
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Event"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector: @selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"day = %@",[NSNumber numberWithInteger:self.day]];
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:self.context
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    }
    else
    {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"doctorCell"];
    
    Event *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"eventCell"];
    }
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.text = event.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ at %@",event.location,event.time];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.event =  [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"eventDisplay" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"eventDisplay"])
    {
        [segue.destinationViewController performSelector:@selector(setEvent:) withObject:self.event];
    }
}
@end
