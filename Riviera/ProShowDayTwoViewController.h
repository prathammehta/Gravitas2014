//
//  ProShowDayTwoViewController.h
//  Riviera
//
//  Created by Pratham Mehta on 19/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "TransitionImageView.h"
#include <netdb.h>

@interface ProShowDayTwoViewController : UIViewController

@property (weak, nonatomic) IBOutlet TransitionImageView *image;
@property (nonatomic ,strong) NSMutableArray *pictures;
@property (nonatomic ,strong) NSArray *textContent;
@property (nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) BOOL imagesDidLoad;
@property (weak, nonatomic) IBOutlet UILabel *loadingDataLabel;

@end
