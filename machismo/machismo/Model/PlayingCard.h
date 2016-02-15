//
//  PlayingCard.h
//  machismo
//
//  Created by Maggie Wang on 16/1/15.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
