//
//  ViewController.m
//  TipCalculator
//
//  Created by Thomas Alexanian on 2016-11-11.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(keyboardWillShow)
                   name:UIKeyboardWillShowNotification
                 object:nil];
    
    [center addObserver:self
               selector:@selector(keyboardWillHide)
                   name:UIKeyboardWillHideNotification
                 object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTip:(UIButton *)sender {
    CGFloat tipPercent = [self.tipPercentageTextField.text floatValue] / 100.00;
    CGFloat tipAmount =  [self.billAmountTextField.text floatValue] * tipPercent;
    CGFloat totalAmount = [self.billAmountTextField.text floatValue] * (tipPercent + 1);
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.02f", tipAmount];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"$%.02f", totalAmount];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentageTextField resignFirstResponder];
}

-(void)keyboardWillShow {
    [UIView animateWithDuration:1.0
                     animations:^{
        self.view.frame = CGRectMake(0, -160, self.view.frame.size.width , self.view.frame.size.height);
                      }];
}

-(void)keyboardWillHide {
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.view.frame = CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height);
                     }];
}

@end
