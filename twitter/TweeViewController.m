//
//  TweeViewController.m
//  twitter
//
//  Created by Eric Hung on 1/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TweeViewController.h"
#import "AFNetworking.h"
#import "TwitterClient.h"

@interface TweeViewController ()

@end

@implementation TweeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization;
        self.title = @"Tweet";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[TwitterClient instance] retweetCountWithId:[self.tweet objectForKey:@"id"] success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", [response objectForKey:@"retweet_count"]);
        NSLog(@"%@", response);
        self.retweetCountLabel.text = [NSString stringWithFormat:@"%@", [response objectForKey:@"retweet_count"]];
        self.favoriteCountLabel.text = [NSString stringWithFormat:@"%@", [response objectForKey:@"favorite_count"]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    self.tweetLabel.text = self.tweet.text;
    self.userNameLabel.text = [self.tweet.tweetUser objectForKey:@"name"];
    NSURL *url = [NSURL URLWithString:[self.tweet.tweetUser objectForKey:@"profile_image_url"]];
    [self.userImageView setImageWithURL:url];
    self.userHandleLabel.text = [self.tweet.tweetUser objectForKey:@"screen_name"];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
