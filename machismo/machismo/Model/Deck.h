//
//  Deck.h
//  machismo
//
//  Created by Maggie Wang on 16/1/15.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


- (void)addCard: (Card *)card atTop: (BOOL)atTop;
- (void)addCard: (Card *)card;

- (Card *)drawRandomCard;



@end
