//
//  ProShowDayTwoViewController.m
//  Riviera
//
//  Created by Pratham Mehta on 19/01/14.
//  Copyright (c) 2014 Pratham Mehta. All rights reserved.
//

#import "ProShowDayTwoViewController.h"

@interface ProShowDayTwoViewController ()

@end

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation ProShowDayTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.backgroundColor = [UIColor blackColor];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    self.index = 0;
    self.imagesDidLoad = NO;
    if([self isNetworkAvailable])
    {
        dispatch_async(kBgQueue, ^(void){
            NSArray *urls = @[[NSURL URLWithString:@"http://vitriviera.com/app/sivamani.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/devassy.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/haricharan.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/vijay.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/swetha.png"],
                              [NSURL URLWithString:@"http://vitriviera.com/app/sreeram.png"]];
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
    self.textView.backgroundColor = [UIColor blackColor];
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
                         @"Anandan Sivamani popularly known as Sivamani is a world renowned percussionist. He plays many instruments including drums, octoban, darkuba, udukai and kanjira. Dance to hi beats this Riviera",
                         @"The energy he delivers while playing the instrument makes him enjoy each and every note he plays which inturn tell the audience a story. Join this prodigy this Riviera",
                         @"Haricharan is a carnatic musician and Indian playback singer. Enjoy this singers beautiful tunes this riviera.",
                         @"Vijay is an Indian playback singer who works predominantly on the south indian music industry. Dance with him this Riviera.",
                         @"Shwetha is the recipient of several coveted awards for her effervescent style of singing. She has rendered her voice for some of the most celebrated music directors. Join her this Riviera.",
                         @"Sreeram Chandra is a professional singer and 2010 Indian Idol winner. He has gifted us with hits like Subahnalla from Yeh Jawani Hai Diwani, Balma Balma and many more!"];
    }
    return _textContent;
}

- (IBAction)showHideMenu:(UIButton *)sender
{
    [self.revealViewController performSelector:@selector(revealToggle:) withObject:nil afterDelay:0];
}

- (IBAction)rightPressed:(UIButton *)sender
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

- (IBAction)leftPressed:(UIButton *)sender
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
@end
