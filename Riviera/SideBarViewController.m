//
//  SideBarViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 17/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "SideBarViewController.h"

@interface SideBarViewController ()

@end

@implementation SideBarViewController

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
    self.sharedInstance = [GlobalClass sharedInstance];
    //self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    //self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    //self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [[UITableViewHeaderFooterView alloc] init];
    switch(section)
    {
        case 0:
            header.textLabel.text = @"Pro Shows";
            break;
        case 1:
            header.textLabel.text = @"Events";
            break;
        case 2:
            header = nil;
            break;
    }
    return header;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==1) return 6;
    else return 4;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) return 80;
    else return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    if(indexPath.section == 0)
    {
        cellIdentifier = @"proShowCell";
    }
    else
    {
        cellIdentifier = @"regularCell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *label;
    if(indexPath.section == 0)
    {
        UIImageView *imageView;
        UITextView *detailtextView = (UITextView *) [cell viewWithTag:2];
        imageView = (UIImageView *) [cell viewWithTag:0];
        //imageView.frame = CGRectMake(0, 9, 90, 61);
        label = (UILabel *) [cell viewWithTag:1];
        switch(indexPath.row)
        {
                case 0:
                imageView.image = [UIImage imageNamed:@"proShowOneIcon.png"];
                label.text = @"6th Feb";
                detailtextView.text = @"Salim & Sulaiman, Shaktishree Gopalan";
                break;
                
                case 1:
                imageView.image = [UIImage imageNamed:@"proShowTwoIcon.png"];
                label.text = @"7th Feb";
                detailtextView.text = @"Sivamani, Devassy, Haricharan, Swetha, Sreeram, Yesudas";
                break;
                
                case 2:
                imageView.image = [UIImage imageNamed:@"proShowThreeIcon.png"];
                label.text = @"8th Feb";
                detailtextView.text = @"Pentagram, Sobhita Dhulipala, Johnson Benjamin";
                break;
                
                case 3:
                imageView.image = [UIImage imageNamed:@"proShowFourIcon.png"];
                label.text = @"9th Feb";
                detailtextView.text = @"DJ Nucleya, Mr Karthi";
                break;
        }
    }
    if(indexPath.section == 1)
    {
        label = (UILabel *) [cell viewWithTag:0];
        switch(indexPath.row)
        {
            case 0:
                label.text = @"6th Feb";
                break;
                
            case 1:
                label.text = @"7th Feb";
                break;
                
            case 2:
                label.text = @"8th Feb";
                break;
                
            case 3:
                label.text = @"9th Feb";
                break;
            case 4:
                label.text = @"Sports Events";
                break;
            case 5:
                label.text = @"Search";
        }
    }
    if(indexPath.section == 2)
    {
        label = (UILabel *) [cell viewWithTag:0];
        switch(indexPath.row)
        {
                case 0:
                label.text = @"About Riviera";
                break;
                
                case 1:
                label.text = @"Get in touch";
                break;
                
                case 2:
                label.text = @"Visit the website";
                break;
                
                case 3:
                label.text = @"Privacy Policy";
                break;
        }
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger selectedRow = 0;
    if(indexPath.section == 0)
    {
        selectedRow = indexPath.row;
    }
    if(indexPath.section == 1)
    {
        selectedRow = 4 + indexPath.row;
    }
    if(indexPath.section == 2)
    {
        selectedRow = 10 + indexPath.row;
    }
    switch(selectedRow)
    {
            case 0:
            [self performSegueWithIdentifier:@"proShowDayOne" sender:self];
            break;
            
            case 1:
            [self performSegueWithIdentifier:@"proShowDayTwo" sender:self];
            break;
            
            case 2:
            [self performSegueWithIdentifier:@"proShowDayThree" sender:self];
            break;
            
            case 3:
            [self performSegueWithIdentifier:@"proShowDayFour" sender:self];
            break;
            
            case 4:
            self.sharedInstance.eventDaySelected = 1;
            [self performSegueWithIdentifier:@"day1event" sender:self];
            break;
            
            case 5:
            self.sharedInstance.eventDaySelected = 2;
            [self performSegueWithIdentifier:@"day2event" sender:self];
            break;
            
            case 6:
            self.sharedInstance.eventDaySelected = 3;
            [self performSegueWithIdentifier:@"day3event" sender:self];
            break;
            
            case 7:
            self.sharedInstance.eventDaySelected = 4;
            [self performSegueWithIdentifier:@"day4event" sender:self];
            break;
            
            case 8:
            [self performSegueWithIdentifier:@"sports" sender:self];
            break;
            
            case 9:
            [self performSegueWithIdentifier:@"search" sender:self];
            break;
            
            case 10:
            [self performSegueWithIdentifier:@"about" sender:self];
            break;
            
            case 11:
            [self performSegueWithIdentifier:@"contact" sender:self];
            break;
            
            case 12:
            [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.vitriviera.com"]];
            break;
            
            case 13:
            [self performSegueWithIdentifier:@"privacy" sender:self];
            break;
    }
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // Set the title of navigation bar by using the menu items
    //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    //destViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
    {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
}
@end
