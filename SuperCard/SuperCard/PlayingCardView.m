//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Maggie Wang on 16/1/30.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (void) setSuit:(NSString *)suit
{
    _suit =suit;
    [self setNeedsDisplay];
}

- (void) setRank:(NSInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];

}

-(void) setFaceUp:(BOOL)faceUp
{
    _faceUp =faceUp;
    [self setNeedsDisplay];

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:<#(UIRectCorner)#> cornerRadii:<#(CGSize)#>]
}


@end
