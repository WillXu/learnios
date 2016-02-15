//
//  CardMatchingGame.m
//  machismo
//
//  Created by Maggie Wang on 16/1/21.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) BOOL isThreeCardMatchingMode;

@end

@implementation CardMatchingGame


- (NSMutableArray *) cards
{
    if (! _cards) _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

- (void) resetGame
{
    self.score = 0;
    for (Card *card in self.cards) {
        card.chosen = NO;
        card.matched = NO;
    }
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                
                [self.cards addObject:card];
            }else
            {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]:nil;
}

static const int MISMATCH_PANETRY = 2;
static const int MATCH_BONUS = 4;

static const int COST_TO_CHOOSE = 1;

-(void) chooseCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    
    self.isThreeCardMatchingMode = 1;
    
    if (! card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else
        {
            if (self.isThreeCardMatchingMode) {
                
                NSMutableArray *othercards;
                othercards = [[NSMutableArray alloc] init];
                
                for (Card *othercard  in self.cards) {
                    if (othercard.isChosen && !othercard.isMatched) {
                        
                        [othercards addObject:othercard];
                        if ([othercards count] == 2) {
                            
                            int matchScore = [card match:othercards];
                            
                            if (matchScore) {
                                self.score += matchScore * MATCH_BONUS;
                                
                                
                                card.matched = YES;
                                
                                for (Card *matchedcard in othercards) {
                                    matchedcard.matched = YES;
                                }
                                
                            }else
                            {
                                self.score -= MISMATCH_PANETRY;
                                ((Card *)[othercards firstObject]).chosen = NO;
                            }
                            
                            break;
                        }
                    }
                }
                
                
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
                
            } else {
            
                for (Card *othercard  in self.cards) {
                    if (othercard.isChosen && !othercard.isMatched) {
                        int matchScore = [card match:@[othercard]];
                        
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            othercard.matched = YES;
                            card.matched = YES;
                            
                            
                        }else
                        {
                            self.score -= MISMATCH_PANETRY;
                            othercard.chosen = NO;
                        }
                        
                        break;
                        
                    }
                }
                
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
            }
        }
    }
}


@end
