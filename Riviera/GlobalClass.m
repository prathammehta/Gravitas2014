//
//  GlobalClass.m
//  Riviera
//
//  Created by Pratham Mehta on 16/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "GlobalClass.h"

@implementation GlobalClass

static GlobalClass *sharedInstance = nil;

+ (GlobalClass *) sharedInstance
{
    if(sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

- (id) init
{
    self = [super init];
    return self;
}

+ (id)allocWithZone:(NSZone*)zone
{
    return [self sharedInstance];
}

- (NSManagedObjectContext *) context
{
    return _context;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (NSData *) data
{
    if(!_data)
    {
        _data = [[NSData alloc] init];
    }
    return _data;
}



@end
