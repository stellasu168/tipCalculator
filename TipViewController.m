//
//  TipViewController.m
//  tip
//
//  Created by Stella Su on 4/19/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UITextField *othertipField;

- (IBAction)onTap:(id)sender;
- (IBAction)tipControlChange:(id)sender;

@end


@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // self.tipLabel.text = @"tip goes here";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {

    NSLog(@"On tap");
    [self.view endEditing:YES];
    
    [self updateValues];
}

- (IBAction)tipControlChange:(id)sender {
    
    [self updateValues];
}

- (void)updateValues
{
    float bill = [self.billField.text floatValue];
    //
    float otherTip = [self.othertipField.text floatValue];
    
    float otherTipPercentage = otherTip / 100;

    NSArray *tipPercentages =
            @[@(0.15), @(0.2), @(0.25)];
    
    float tipPercentage = [tipPercentages [self.tipControl.selectedSegmentIndex] floatValue];
    
    float tip = bill*tipPercentage;
    float total = bill + tip;
    float newTip = bill*otherTipPercentage;
    float othertipTotal = bill + (bill*otherTipPercentage);
    
    //
    if (otherTip > 0){
        //float total = bill + (bill*otherTip);
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", newTip];
        
        self.totalLabel.text =[NSString stringWithFormat:@"$%.2f", othertipTotal];
        
    } else {
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    }
    
}

@end
