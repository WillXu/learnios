//
//  PlayingCard.m
//  machismo
//
//  Created by Maggie Wang on 16/1/15.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            
            PlayingCard *othercard = (PlayingCard *)card;
            if (othercard.rank == self.rank) {
                score =4;
            }else if ([othercard.suit isEqual:self.suit])
            {
                score =1;
            }
        }
    } else if ([otherCards count] == 2)
    {
        id card1 = otherCards[1];
        id card2 = otherCards[2];
        if (([card1 isKindOfClass:[PlayingCard class]]) && ([card2 isKindOfClass:[PlayingCard class]])) {
            
            PlayingCard *othercard1 = (PlayingCard *)card1;
            PlayingCard *othercard2 = (PlayingCard *)card2;
            
            if ((othercard1.rank == self.rank) && (othercard2.rank == self.rank)) {
                score = 12;
            }else if ((othercard1.rank == self.rank) || (othercard2.rank == self.rank) || (othercard2.rank == othercard1.rank)) {
                score = 4;
            }else if (([othercard1.suit isEqual:self.suit]) && ([othercard2.suit isEqual:self.suit]))
            {
                score = 3;
            }else if (([othercard1.suit isEqual:self.suit]) || ([othercard2.suit isEqual:self.suit]) || ([othercard2.suit isEqual:othercard1.suit]))
            {
                score = 1;
            }
        }
        
    }
        
    
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank {return [[self rankStrings] count] -1; }

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
