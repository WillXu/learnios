//
//  Deck.m
//  machismo
//
//  Created by Maggie Wang on 16/1/15.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; //of Card

@end

@implementation Deck

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
    
}


- (void)addCard: (Card *)card atTop: (BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
}

- (void)addCard: (Card *)card
{
    
    [self addCard:card atTop:NO];
}


- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    unsigned int count = [self.cards count];
    
    if (count) {
        unsigned index = arc4random() % count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
