//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Maggie Wang on 16/1/30.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic)BOOL faceUp;

@end
