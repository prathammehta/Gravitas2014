//
//  EventDetailsViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 22/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event+Operations.h"
#import <MapKit/MapKit.h>


@interface EventDetailsViewController : UIViewController

@property (nonatomic, strong) Event *event;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *catagory;
@property (weak, nonatomic) IBOutlet UITextView *discription;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *phone1;
@property (weak, nonatomic) IBOutlet UILabel *phone2;
@property (weak, nonatomic) IBOutlet UILabel *cood1;
@property (weak, nonatomic) IBOutlet UILabel *cood2;
@property (weak, nonatomic) IBOutlet UITextView *rules;



@end
