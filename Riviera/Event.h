//
//  Event.h
//  Riviera
//
//  Created by Pratham Mehta on 22/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * contactEmail;
@property (nonatomic, retain) NSString * contactPhoneNumber;
@property (nonatomic, retain) NSString * coordiantors;
@property (nonatomic, retain) NSString * descriptionOfEvent;
@property (nonatomic, retain) NSNumber * firstPrize;
@property (nonatomic, retain) NSString * introduction;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * locationURL;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * registrationCost;
@property (nonatomic, retain) NSString * rules;
@property (nonatomic, retain) NSNumber * secondPrize;
@property (nonatomic, retain) NSNumber * thirdPrize;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSNumber * day;

@end
