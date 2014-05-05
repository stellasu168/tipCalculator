//
//  TipViewController.m
//  tip
//
//  Created by Stella Su on 4/19/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (IBAction)tipControlChange:(id)sender;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)tipControlChange:(id)sender {
    
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultPercentage = [defaults integerForKey:@"defaultPercentage"];
    
    self.tipControl.selectedSegmentIndex = defaultPercentage;
    
    [self updateValues];
    
}


- (void)updateValues
{
    float bill = [self.billField.text floatValue];
  
    NSArray *tipPercentages =
            @[@(0.15), @(0.2), @(0.25)];
    
    float tipPercentage = [tipPercentages [self.tipControl.selectedSegmentIndex] floatValue];
    
    float tip = bill*tipPercentage;
    float total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}

@end
