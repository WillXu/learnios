//
//  PlayingCardGameViewController.m
//  machismo
//
//  Created by Maggie Wang on 16/1/27.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}
@end
