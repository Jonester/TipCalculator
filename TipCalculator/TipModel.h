//
//  TipModel.h
//  TipCalculator
//
//  Created by Chris Jones on 2017-01-20.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipModel : NSObject

-(NSString *)calculateTip: (NSString *)billAmount tipPercent: (NSString *)tipPercent;

@end
