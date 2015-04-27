//
//  ProShowDayOneViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 18/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "ProShowDayOneViewController.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@interface ProShowDayOneViewController ()

@end

@implementation ProShowDayOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.index = 0;
    self.imagesDidLoad = NO;
    if([self isNetworkAvailable])
    {
        dispatch_async(kBgQueue, ^(void){
            NSArray *urls = @[[NSURL URLWithString:@"http://vitriviera.com/app/salim.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/shaktishree.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/stylecheck.png"]];
            for (NSURL *url in urls)
            {
                NSData *data = [NSData dataWithContentsOfURL:url];
                UIImage *image = [[UIImage alloc] initWithData:data];
                [self.pictures addObject:image];
            }
            self.imagesDidLoad = YES;
            [self performSelectorOnMainThread:@selector(setInitialImage) withObject:Nil waitUntilDone:NO];
        });
    }
    else
    {
        self.loadingDataLabel.text = @"No internet";
    }
}


-(BOOL)isNetworkAvailable
{
    char *hostname;
    struct hostent *hostinfo;
    hostname = "google.com";
    hostinfo = gethostbyname(hostname);
    if (hostinfo == NULL){
        NSLog(@"-> no connection!\n");
        return NO;
    }
    else{
        NSLog(@"-> connection established!\n");
        return YES;
    }
}

- (void) setInitialImage
{
    self.image.backgroundColor = [UIColor blackColor];
    self.image.image = [self.pictures objectAtIndex:0];
    self.textView.text = [self.textContent objectAtIndex:0];
}

- (NSMutableArray *) pictures
{
    if(!_pictures)
    {
        _pictures = [[NSMutableArray alloc] init];
    }
    return _pictures;
}

- (NSArray *) textContent
{
    if(!_textContent)
    {
        _textContent = @[
                         @"Salim Merchant and Sulaiman Merchant are a pair of musician brothers, born and brought up in Bhuj, Kutch, Gujarat. Rock out to their music this Riviera.",
                         @"Shaktishree Gopalan is an indian vocalist, songwriter and performer in both indian contemporary, pop and soft rock genres. Jam to her tunes this Riviera",
                         @"Be it high end classy or street fasion, or smooth and suave and dripping charm. Fashion is art depicted in forms of clothing. Giving a glimpse of various trends followed in variois places over the years. Undoubtedly one of the most classy events of Riviera. One of our biggest crowd pullers."];
    }
    return _textContent;
}

- (IBAction)rightPressed:(UIButton *)sender
{
    if(self.imagesDidLoad)
    {
        if(self.index < [self.pictures count]-1)
        {
            self.index++;
            [self.image setImage:[self.pictures objectAtIndex:self.index] withTransitionAnimation:NO];
            self.textView.text = [self.textContent objectAtIndex:self.index];
        }
    }
}

- (IBAction)leftPressed:(UIButton *)sender
{
    if(self.imagesDidLoad)
    {
        if(self.index > 0)
        {
            self.index--;
            [self.image setImage:[self.pictures objectAtIndex:self.index] withTransitionAnimation:NO];
            self.textView.text = [self.textContent objectAtIndex:self.index];
        }
    }
}

- (IBAction)showHideMenu:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0];
}


@end
