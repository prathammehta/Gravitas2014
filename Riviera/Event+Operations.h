//
//  Event+Operations.h
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "Event.h"

@interface Event (Operations)

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
              WithContext:(NSManagedObjectContext *) context;

@end
