//
//  AlertsTableViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 04/02/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "AlertsTableViewController.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface AlertsTableViewController ()

@end

@implementation AlertsTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataRecived = NO;
    if([self isNetworkAvailable])
    {
        dispatch_async(kBgQueue, ^(void)
                       {
                          self.data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://vitriviera.com/api/alerts.php"]];
                           [self performSelectorOnMainThread:@selector(setupData) withObject:nil waitUntilDone:NO];
                       });
    }
}

- (void) setupData
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:self.data
                                                         options:kNilOptions
                                                           error:nil];
    NSMutableArray *alertsAll = [json objectForKey:@"alert"];
    for(NSDictionary *alert in alertsAll)
    {
        if([[alert objectForKey:@"alert_status"] isEqualToString:@"active"])
        {
            [self.alerts addObject:alert];
        }
    }
    self.dataRecived = YES;
    [self.tableView reloadData];
}

- (NSMutableArray *) alerts
{
    if(!_alerts)
    {
        _alerts = [[NSMutableArray alloc] init];
    }
    return _alerts;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)isNetworkAvailable
{
    char *hostname;
    struct hostent *hostinfo;
    hostname = "google.com";
    hostinfo = gethostbyname(hostname);
    if (hostinfo == NULL){
        NSLog(@"-> no connection!\n");
        return NO;
    }
    else{
        NSLog(@"-> connection established!\n");
        return YES;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.dataRecived)
    {
        return [self.alerts count];
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"alertCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    NSDictionary *alertInfo = [self.alerts objectAtIndex:[indexPath row]];
    cell.textLabel.text = [alertInfo objectForKey:@"alert"];
    cell.detailTextLabel.text = [alertInfo objectForKey:@"alert_desc"];
    return cell;
}
@end
