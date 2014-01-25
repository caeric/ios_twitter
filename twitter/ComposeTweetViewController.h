//
//  ComposeTweetViewController.h
//  twitter
//
//  Created by Eric Hung on 1/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeTweetViewController : UIViewController <UITextViewDelegate>
- (IBAction)onCancelClicked:(id)sender;
- (IBAction)onTweetClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *userTweetNameLabel;

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@property (weak, nonatomic) IBOutlet UIImageView *userTweetImageView;
@property (weak, nonatomic) IBOutlet UILabel *userTweetHandleLabel;

@property (weak, nonatomic) IBOutlet UILabel *tweetCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;

@end
