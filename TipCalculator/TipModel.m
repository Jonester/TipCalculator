//
//  TipModel.m
//  TipCalculator
//
//  Created by Chris Jones on 2017-01-20.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "TipModel.h"

@interface TipModel ()

@property (nonatomic, strong) NSNumber *tipAmount;

@end

@implementation TipModel

-(NSString *)calculateTip: (NSString *)billAmount tipPercent: (NSString *)tipPercent {
    self.tipAmount = @([billAmount floatValue] * [tipPercent floatValue]/100);
    
    NSNumberFormatter *currencyFormat = [NSNumberFormatter new];
    [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    return [currencyFormat stringFromNumber:self.tipAmount];
    
    
}



@end
