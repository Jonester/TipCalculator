//
//  TipModel.m
//  TipCalculator
//
//  Created by Chris Jones on 2017-01-20.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "TipModel.h"

@interface TipModel ()

@property (nonatomic, assign) float tipAmount;

@end

@implementation TipModel

-(NSString *)calculateTip: (NSString *)billAmount tipPercent: (NSString *)tipPercent {
    self.tipAmount = [billAmount floatValue] * [tipPercent floatValue]/100;
    return [NSString stringWithFormat:@"$%.2f", self.tipAmount];
}



@end
