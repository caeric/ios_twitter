//
//  ComposeTweetViewController.m
//  twitter
//
//  Created by Eric Hung on 1/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ComposeTweetViewController.h"
#import "TweetUser.h"
#import "User.h"
#import "AFNetworking.h"

#define TWEET_MAX_LENGTH 140

@interface ComposeTweetViewController ()

@end

@implementation ComposeTweetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil// withUser:(TweetUser*)user
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.userTweetNameLabel.text  = [[User currentUser] objectForKey:@"name"];
    self.userTweetHandleLabel.text = [[User currentUser] objectForKey:@"screen_name"];
    self.tweetTextView.delegate = self;
    NSURL *url = [NSURL URLWithString:[[User currentUser] objectForKey:@"profile_image_url"]];
    [self.userTweetImageView setImageWithURL:url];
    self.tweetButton.enabled = NO;
    [self.tweetTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancelClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onTweetClicked:(id)sender {
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSUInteger newLength = (textView.text.length - range.length) + text.length;
    
    if (newLength <= TWEET_MAX_LENGTH) {
        return YES;
    } else {
        NSUInteger emptyIndex = TWEET_MAX_LENGTH - (textView.text.length - range.length);
        textView.text = [[[textView.text substringToIndex:range.location] stringByAppendingString:[text substringToIndex:emptyIndex]] stringByAppendingString:[textView.text substringFromIndex:(range.location + range.length)]];
        return NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    self.tweetCountLabel.text = [NSString stringWithFormat:@"%d", (140 - [textView.text length])];
    if ([textView.text length] > 0) {
        self.tweetButton.enabled = YES;
    } else {
        self.tweetButton.enabled = NO;
    }
}


@end
