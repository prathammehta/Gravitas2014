//
//  EventDetailsViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 22/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "EventDetailsViewController.h"

@interface EventDetailsViewController ()

@end

@implementation EventDetailsViewController

- (void) setEvent:(Event *)event
{
    _event = event;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.scrollView.contentSize = CGSizeMake(960,236);
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.name.text = self.event.name;
    self.location.text = self.event.location;
    self.time.text = self.event.time;
    self.catagory.text = self.event.category;
    if([self.event.description isEqualToString:@"NULL"])
    {
        self.discription.text = @"Rules not available yet for this event. Please check back later.";
    }
    else
    {
        self.discription.text = self.event.descriptionOfEvent;
    }
    self.cood1.text = self.event.coordiantors;
    self.cood2.text = self.event.introduction;
    self.phone1.text = self.event.contactPhoneNumber;
    self.phone2.text = self.event.contactEmail;
    if([self.event.descriptionOfEvent isEqualToString:@"NULL"])
    {
        self.rules.text = @"Description not available yet for this event. Please check back later.";
    }
    else
    {
        self.rules.text = self.event.rules;
    }
    switch (self.event.day.intValue) {
        case 1:
            self.date.text = @"6th Feb 2014";
            break;
            
        case 2:
            self.date.text = @"7th Feb 2014";
            break;
        
        case 3:
            self.date.text = @"8th Feb 2014";
            break;
        
        case 4:
            self.date.text = @"9th Feb 2014";
            break;
            
        default:
            break;
    }
    CLLocationCoordinate2D location;
    location.longitude = 79.15768;
    location.latitude = 12.97239;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 1000, 1000);
    [self.mapView setRegion:viewRegion animated:YES];
    [self getMapLocation];
}

- (void) getMapLocation
{
    CLLocationCoordinate2D eventLocation;
    if([self.event.location hasPrefix:@"Technology Tower"])
    {
        eventLocation.latitude = 12.97080;
        eventLocation.longitude = 79.15945;
    }
    if([self.event.location hasPrefix:@"Greenos"])
    {
        eventLocation.latitude = 12.96950;
        eventLocation.longitude = 79.15841;
    }
    if([self.event.location hasPrefix:@"Main Building"])
    {
        eventLocation.latitude = 12.96930;
        eventLocation.longitude = 79.15591;
    }
    if([self.event.location hasPrefix:@"Woodstock Garden"])
    {
        eventLocation.latitude = 12.97046;
        eventLocation.longitude = 79.15753;
    }
    if([self.event.location hasPrefix:@"Throw Ball Court"])
    {
        eventLocation.latitude = 12.97007;
        eventLocation.longitude = 79.15846;
    }
    if([self.event.location hasPrefix:@"Centre for Disaster Mitigation And Management"])
    {
        eventLocation.latitude = 12.96919;
        eventLocation.longitude = 79.15493;
    }
    if([self.event.location hasPrefix:@"Road in front of Silver Jubile"])
    {
        eventLocation.latitude = 12.97186;
        eventLocation.longitude = 79.16366;
    }
    if([self.event.location hasPrefix:@"Anna Auditorium"])
    {
        eventLocation.latitude = 12.96996;
        eventLocation.longitude = 79.15564;
    }
    if([self.event.location hasPrefix:@"Foodys"])
    {
        eventLocation.latitude = 12.96900;
        eventLocation.longitude = 79.15832;
    }
    if([self.event.location hasPrefix:@"Technology Tower Amphitheater"])
    {
        eventLocation.latitude = 12.97080;
        eventLocation.longitude = 79.15945;
    }
    if([self.event.location hasPrefix:@"Hexagon"])
    {
        eventLocation.latitude = 12.96928;
        eventLocation.longitude = 79.15771;
    }
    if([self.event.location hasPrefix:@"Rocket Point"])
    {
        eventLocation.latitude = 12.97080;
        eventLocation.longitude = 79.15838;
    }
    if([self.event.location hasPrefix:@"Anna Auditorium Volleyball Court"])
    {
        eventLocation.latitude = 12.96996;
        eventLocation.longitude = 79.15564;
    }
    if([self.event.location hasPrefix:@"Food Court Basketball Court"])
    {
        eventLocation.latitude = 12.97042;
        eventLocation.longitude = 79.15841;
    }
    if([self.event.location hasPrefix:@"Anna Audi"])
    {
        eventLocation.latitude = 12.96996;
        eventLocation.longitude = 79.15564;
    }
    if([self.event.location hasPrefix:@"Silver Jubile"])
    {
        eventLocation.latitude = 12.97186;
        eventLocation.longitude = 79.16366;
    }

    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = eventLocation;
    annotation.title = @"Event Location";
    annotation.subtitle = self.event.location;
    [self.mapView addAnnotation:annotation];
    //[self.mapView selectAnnotation:annotation animated:YES];
}

- (IBAction)donePressed:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"eventDetailsViewDonePressed" object:nil];
}
@end
