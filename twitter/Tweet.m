//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet


- (id)initWithDictionary:(NSDictionary *)data {
    if (self = [super initWithDictionary:data]) {
        self.tweetUser = [[TweetUser alloc]initWithDictionary:[self.data objectForKey:@"user"]];
    }
    
    return self;
}

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
