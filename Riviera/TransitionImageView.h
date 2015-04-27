//
//  TransitionImageView.h
//  Riviera
//
//  Created by Pratham Mehta on 18/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TransitionImageView : UIImageView
{
    UIImageView *mOriginalImageViewContainerView;
    UIImageView *mIntermediateTransitionView;
}
@property (nonatomic, retain) UIImageView *originalImageViewContainerView;
@property (nonatomic, retain) UIImageView *intermediateTransitionView;

#pragma mark -
#pragma mark Animation methods
-(void)setImage:(UIImage *)inNewImage withTransitionAnimation:(BOOL)inAnimation;

@end