//
//  Card.h
//  machismo
//
//  Created by Maggie Wang on 16/1/15.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
