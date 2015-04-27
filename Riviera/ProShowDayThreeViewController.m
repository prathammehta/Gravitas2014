//
//  ProShowDayThreeViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 19/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "ProShowDayThreeViewController.h"

@interface ProShowDayThreeViewController ()

@end

@implementation ProShowDayThreeViewController

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.imagesDidLoad = NO;
    if([self isNetworkAvailable])
    {
        dispatch_async(kBgQueue, ^(void){
            NSArray *urls = @[[NSURL URLWithString:@"http://vitriviera.com/app/pentagram.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/frisk.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/benjamin.png"]]; // Change to benjamin!!
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
    self.imageView.backgroundColor = [UIColor blackColor];
    self.textView.backgroundColor = [UIColor clearColor];
    self.imageView.image = [self.pictures objectAtIndex:0];
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
                         @"Pentagram is a four piece Indian rock/electronica band started in 1994 in Mumbai, India. Regarded as one of the pioneers of original Indian independent music,",
                         @"College teams are judged based on choreography, musicality, creativity, themes and beat sense. Performances will include classical, indo jazz, hip hop, freestyle and many more, This is one of the oldest compitions in Riviera. ",
                         @"An amazing keyboard performance awaits you this Riviera."
                         ];
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
            [self.imageView setImage:[self.pictures objectAtIndex:self.index] withTransitionAnimation:NO];
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
            [self.imageView setImage:[self.pictures objectAtIndex:self.index] withTransitionAnimation:NO];
            self.textView.text = [self.textContent objectAtIndex:self.index];
        }

    }
}


- (IBAction)hideShowMenu:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0];
}

@end
