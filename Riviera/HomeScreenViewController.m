//
//  HomeScreenViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 19/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#import "HomeScreenViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sharedInstance = [GlobalClass sharedInstance];
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent:@"database"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    if([[NSFileManager defaultManager] fileExistsAtPath:url.path])
    {
        [document openWithCompletionHandler:^(BOOL success) {
            self.sharedInstance.context = document.managedObjectContext;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ManagedObjectSet" object:document.managedObjectContext];
            [self setup];
        }];
    }
    else if(![[NSFileManager defaultManager] fileExistsAtPath:url.path])
    {
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            self.sharedInstance.context = document.managedObjectContext;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ManagedObjectSet" object:document.managedObjectContext];
            [self setup];
        }];
    }
    else
    {
        self.sharedInstance.context = document.managedObjectContext;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ManagedObjectSet" object:document.managedObjectContext];
        [self setup];
    }
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
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

- (void) setup
{
    if([self isNetworkAvailable])
    {
        dispatch_async(kBgQueue, ^{
            NSData* data = [NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://vitriviera.com/api/echo.php"]];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:NO];
        });
    }
    else
    {
        self.alertView.hidden = YES;
    }
}

- (void) fetchedData:(NSData*) data
{
    self.sharedInstance.data = data;
    NSFetchRequest *allEvents = [[NSFetchRequest alloc] init];
    [allEvents setEntity:[NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.sharedInstance.context]];
    [allEvents setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error = nil;
    NSArray *events = [self.sharedInstance.context executeFetchRequest:allEvents error:&error];
    //error handling goes here
    for (NSManagedObject * event in events) {
        [self.sharedInstance.context deleteObject:event];
    }
    NSError *saveError = nil;
    [self.sharedInstance.context save:&saveError];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:nil];
    NSArray *day1,*day2,*day3,*day4;
    NSString *location,*description,*rules;
    day1 = [json objectForKey:@"eventsday1"];
    day2 = [json objectForKey:@"eventsday2"];
    day3 = [json objectForKey:@"eventsday3"];
    day4 = [json objectForKey:@"eventsday4"];
    
    for(NSDictionary *event in day1)
    {
        if([[event objectForKey:@"event_room"] isEqualToString:@"NULL"])
        {
            location = [NSString stringWithFormat:@"%@",[event objectForKey:@"event_location"]];
        }
        else
        {
            location = [NSString stringWithFormat:@"%@ %@",[event objectForKey:@"event_location"],[event objectForKey:@"event_room"]];
        }
        if([[event objectForKey:@"event_desc"] isEqualToString:@"NULL"])
        {
            description = @"Not available right now. Please check back later";
        }
        else
        {
            description = [event objectForKey:@"event_desc"];
        }
        if([[event objectForKey:@"event_rules"] isEqualToString:@"NULL"])
        {
            rules = @"Not available right now. Please check back later";
        }
        else
        {
            rules = [event objectForKey:@"event_rules"];
        }
        [Event addEventWithName:[event objectForKey:@"event_name"]
               WithIntroduction:[event objectForKey:@"event_co2"]
                      WithRules:rules
                   WithLocation:location
                WithLocationURL:nil
                WithDescription:description
               WithCoordinators:[event objectForKey:@"event_co1"]
         WithContactPhoneNumber:[event objectForKey:@"event_com1"]
               WithContactEmail:[event objectForKey:@"event_com2"]
                   WithCategory:[event objectForKey:@"event_type"]
                 WithThirdPrize:0
                WithSecondPrize:0
                 WithFirstPrize:0
           withRegistrationCost:0
                       withTime:[event objectForKey:@"event_time"]
                        withDay:1
                    WithContext:self.sharedInstance.context];
    }
    for(NSDictionary *event in day2)
    {
        if([[event objectForKey:@"event_room"] isEqualToString:@"NULL"])
        {
            location = [NSString stringWithFormat:@"%@",[event objectForKey:@"event_location"]];
        }
        else
        {
            location = [NSString stringWithFormat:@"%@ %@",[event objectForKey:@"event_location"],[event objectForKey:@"event_room"]];
        }
        if([[event objectForKey:@"event_desc"] isEqualToString:@"NULL"])
        {
            description = @"Not available right now. Please check back later";
        }
        else
        {
            description = [event objectForKey:@"event_desc"];
        }
        if([[event objectForKey:@"event_rules"] isEqualToString:@"NULL"])
        {
            rules = @"Not available right now. Please check back later";
        }
        else
        {
            rules = [event objectForKey:@"event_rules"];
        }
        [Event addEventWithName:[event objectForKey:@"event_name"]
               WithIntroduction:[event objectForKey:@"event_co2"]
                      WithRules:rules
                   WithLocation:location
                WithLocationURL:nil
                WithDescription:description
               WithCoordinators:[event objectForKey:@"event_co1"]
         WithContactPhoneNumber:[event objectForKey:@"event_com1"]
               WithContactEmail:[event objectForKey:@"event_com2"]
                   WithCategory:[event objectForKey:@"event_type"]
                 WithThirdPrize:0
                WithSecondPrize:0
                 WithFirstPrize:0
           withRegistrationCost:0
                       withTime:[event objectForKey:@"event_time"]
                        withDay:2
                    WithContext:self.sharedInstance.context];
    }
    for(NSDictionary *event in day3)
    {
        if([[event objectForKey:@"event_room"] isEqualToString:@"NULL"])
        {
            location = [NSString stringWithFormat:@"%@",[event objectForKey:@"event_location"]];
        }
        else
        {
            location = [NSString stringWithFormat:@"%@ %@",[event objectForKey:@"event_location"],[event objectForKey:@"event_room"]];
        }
        if([[event objectForKey:@"event_desc"] isEqualToString:@"NULL"])
        {
            description = @"Not available right now. Please check back later";
        }
        else
        {
            description = [event objectForKey:@"event_desc"];
        }
        if([[event objectForKey:@"event_rules"] isEqualToString:@"NULL"])
        {
            rules = @"Not available right now. Please check back later";
        }
        else
        {
            rules = [event objectForKey:@"event_rules"];
        }
        [Event addEventWithName:[event objectForKey:@"event_name"]
               WithIntroduction:[event objectForKey:@"event_co2"]
                      WithRules:rules
                   WithLocation:location
                WithLocationURL:nil
                WithDescription:description
               WithCoordinators:[event objectForKey:@"event_co1"]
         WithContactPhoneNumber:[event objectForKey:@"event_com1"]
               WithContactEmail:[event objectForKey:@"event_com2"]
                   WithCategory:[event objectForKey:@"event_type"]
                 WithThirdPrize:0
                WithSecondPrize:0
                 WithFirstPrize:0
           withRegistrationCost:0
                       withTime:[event objectForKey:@"event_time"]
                        withDay:3
                    WithContext:self.sharedInstance.context];
    }
    for(NSDictionary *event in day4)
    {
        if([[event objectForKey:@"event_room"] isEqualToString:@"NULL"])
        {
            location = [NSString stringWithFormat:@"%@",[event objectForKey:@"event_location"]];
        }
        else
        {
            location = [NSString stringWithFormat:@"%@ %@",[event objectForKey:@"event_location"],[event objectForKey:@"event_room"]];
        }
        if([[event objectForKey:@"event_desc"] isEqualToString:@"NULL"])
        {
            description = @"Not available right now. Please check back later";
        }
        else
        {
            description = [event objectForKey:@"event_desc"];
        }
        if([[event objectForKey:@"event_rules"] isEqualToString:@"NULL"])
        {
            rules = @"Not available right now. Please check back later";
        }
        else
        {
            rules = [event objectForKey:@"event_rules"];
        }
        [Event addEventWithName:[event objectForKey:@"event_name"]
               WithIntroduction:[event objectForKey:@"event_co2"]
                      WithRules:rules
                   WithLocation:location
                WithLocationURL:nil
                WithDescription:description
               WithCoordinators:[event objectForKey:@"event_co1"]
         WithContactPhoneNumber:[event objectForKey:@"event_com1"]
               WithContactEmail:[event objectForKey:@"event_com2"]
                   WithCategory:[event objectForKey:@"event_type"]
                 WithThirdPrize:0
                WithSecondPrize:0
                 WithFirstPrize:0
           withRegistrationCost:0
                       withTime:[event objectForKey:@"event_time"]
                        withDay:4
                    WithContext:self.sharedInstance.context];
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGRect reset1,reset2;
    reset1 = self.crowdFirst.frame;
    reset2 = self.crowdSecond.frame;
    [UIView animateWithDuration:10
                          delay:0
                        options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat)
                     animations:^(void){
                         CGPoint newLocation = self.crowdFirst.center;
                         newLocation.x = self.crowdFirst.center.x + 320;
                         self.crowdFirst.center = newLocation;}
                     completion:nil];
    [UIView animateWithDuration:10
                          delay:0
                        options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat)
                     animations:^(void){
                         CGPoint newLocation = self.crowdSecond.center;
                         newLocation.x = self.crowdSecond.center.x + 320;
                         self.crowdSecond.center = newLocation;}
                     completion:nil];
    self.screenName = @"Home Screen";
}

- (IBAction)continuePressed:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0.0];
}
@end
