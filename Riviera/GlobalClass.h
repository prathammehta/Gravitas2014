//
//  GlobalClass.h
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalClass : NSObject

+ (id) sharedInstance;

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSData *data;
@property (nonatomic) NSInteger eventDaySelected;

@end
