//
//  ViewController.m
//  TipCalculator
//
//  Created by Chris Jones on 2017-01-20.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "ViewController.h"
#import "TipModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.billAmountTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [self.tipPercentTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    self.billAmountTextField.delegate = self;
    self.tipPercentTextField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateTip:(UIButton *)sender {
    TipModel *tip = [TipModel new];
    self.tipAmountLabel.text = [tip calculateTip:self.billAmountTextField.text
           tipPercent:self.tipPercentTextField.text];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.billAmountTextField resignFirstResponder];
        [self.tipPercentTextField resignFirstResponder];
    }
        
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
