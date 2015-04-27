//
//  Event+Operations.m
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "Event+Operations.h"

@implementation Event (Operations)

+ (void) addEventWithName:(NSString *) name
         WithIntroduction:(NSString *) introduction
                WithRules:(NSString *) rules
             WithLocation:(NSString *) location
          WithLocationURL:(NSString *) locationURL
          WithDescription:(NSString *) description
         WithCoordinators:(NSString *) coordinators
   WithContactPhoneNumber:(NSString *) phoneNumber
         WithContactEmail:(NSString *) email
             WithCategory:(NSString *) category
           WithThirdPrize:(float) third
          WithSecondPrize:(float) second
           WithFirstPrize:(float) first
     withRegistrationCost:(float) regCost
                 withTime:(NSString *) time
                 withDay:(NSInteger) day
              WithContext:(NSManagedObjectContext *) context
{
    Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
    event.name = name;
    event.introduction = introduction;
    event.rules = rules;
    event.location = location;
    event.locationURL = locationURL;
    event.descriptionOfEvent = description;
    event.coordiantors = coordinators;
    event.contactPhoneNumber = phoneNumber;
    event.contactEmail = email;
    event.category = category;
    event.thirdPrize = [NSNumber numberWithFloat:third];
    event.secondPrize = [NSNumber numberWithFloat:second];
    event.firstPrize = [NSNumber numberWithFloat:first];
    event.registrationCost = [NSNumber numberWithFloat:regCost];
    event.day = [NSNumber numberWithInteger:day];
    event.time = time;
}

@end
