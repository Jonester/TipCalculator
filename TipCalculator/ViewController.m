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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.billAmountTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [self.tipPercentTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    self.billAmountTextField.delegate = self;
    self.tipPercentTextField.delegate = self;
    
    NSNotificationCenter *notifyCenter = [NSNotificationCenter defaultCenter];
    [notifyCenter addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    _oldConstraint = self.bottomConstraint.constant;
    
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

-(void)keyboardDidShow:(NSNotification*)notification {
    NSValue *keyboardrect = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = keyboardrect.CGRectValue;
    CGFloat yPos = rect.origin.y;
    CGFloat screenHeight = self.view.bounds.size.height;
    
    if (yPos == screenHeight) {
        self.bottomConstraint.constant = self.oldConstraint;
    } else {
        self.bottomConstraint.constant = (screenHeight - yPos) + 30;
    }
    NSLog(@"%f %f", screenHeight, yPos);
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
