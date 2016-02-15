//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Maggie Wang on 16/1/27.
//  Copyright (c) 2016年 Maggie Wang. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharacterLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharacterLabel;

@end

@implementation TextStatsViewController


- (void) setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void) updateUI
{
    self.colorfulCharacterLabel.text = [NSString stringWithFormat:@"%d colorful characters",[[self charactorsWithAttribute:NSForegroundColorAttributeName] length]];

    self.outlinedCharacterLabel.text = [NSString stringWithFormat:@"%d outlined characters",[[self charactorsWithAttribute:NSStrokeColorAttributeName ] length]];
    
 }


- (NSAttributedString *) charactorsWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else
        {
            index++;
        }
    }
    
    return characters;
}


@end
