//
//  SettingsViewController.m
//  tip
//
//  Created by Stella Su on 5/4/14.
//  Copyright (c) 2014 Stella Su. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefault;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger defaultPercentage = [defaults integerForKey:@"selectedPercentage"];
    
    self.tipDefault.selectedSegmentIndex = defaultPercentage;
    
}

- (IBAction)defaultTipSelected:(id)sender
{
    
    NSInteger defaultPercentage = self.tipDefault.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger: defaultPercentage forKey:@"defaultPercentage"];
    [defaults synchronize];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
