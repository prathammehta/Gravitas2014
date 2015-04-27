//
//  SportsListViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 25/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "SportsListViewController.h"

@interface SportsListViewController ()

@end

@implementation SportsListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titles = @[@"Cricket T20 (Men)",@"Hockey (Men)",@"Handball (Men)",@"Tennis (Men & Women)",@"Table Tennis (Men & Women)",@"Badminton (Men & Women)",@"Throwball (Women)",@"Chess (Combined)",@"Snooker (Men)",@"Mr. Riviera (Men)",@"Basketball (Men & Women)",@"Volleyball (Men & Women)",@"Football (Men)",@"Swimming (Men)",@"Swimming (Women)"];
    self.dates = @[@"26th to 28th Jan",@"27th to 28th Jan",@"27th to 28th Jan",@"4th to 5th Feb",@"4th to 5th Feb",@"4th to 5th Feb",@"4th to 5th Feb",@"4th to 5th Feb",@"5th Feb",@"6th Feb",@"5th to 7th Feb",@"5th to 7th Feb",@"5th to 7th Feb",@"7th Feb",@"7th Feb"];
    self.venues = @[@"SJT Grounds",@"Outdoor Stadium",@"Outdoor Stadium",@"Anna Auditorium Tennis Court",@"Indoor Sports Room",@"Badminton Court",@"Throwball Court",@"Foodys",@"Indoor Sports Room",@"Boys Indoor Stadium",@"Anna Auditorium Basketball Court",@"Anna Auditorium Volleyball Court",@"SJT Grounds",@"Boys Swimming Pools",@"Girls Swimming Pools"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sportEventCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"sportEventCell"];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [self.titles objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ at %@, at 9:00 a.m.",[self.venues objectAtIndex:[indexPath row]],[self.dates objectAtIndex:[indexPath row]]];
    return cell;
}

@end
