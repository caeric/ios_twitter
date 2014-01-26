//
//  TweeViewController.m
//  twitter
//
//  Created by Eric Hung on 1/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TweeViewController.h"

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

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
