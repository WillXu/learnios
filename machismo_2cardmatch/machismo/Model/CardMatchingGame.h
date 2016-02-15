//
//  CardMatchingGame.h
//  machismo
//
//  Created by Maggie Wang on 16/1/21.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex:(NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger) index;

- (void) resetGame;

@property (nonatomic, readonly) NSUInteger score;

@end
