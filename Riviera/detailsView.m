//
//  detailsView.m
//  Riviera
//
//  Created by Pratham Mehta on 26/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "detailsView.h"

@implementation detailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 100, 30)];
    locationLabel.text = self.location;
    [self addSubview:locationLabel];
}


@end
