//
//  ViewController.m
//  Calculator-ObjectiveC
//
//  Created by Anthony Walker on 8/22/15.
//  Copyright (c) 2015 Anthony.Walker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation ViewController

int firstNumber = 0;
int secondNumber = 0;
int runningTotal = 0;
NSString *operation = @"";
NSString *displayStack = @"";
NSString *runningString = @"";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberPressed:(id)sender {
    NSString *buttonTitle = [(UIButton *) sender currentTitle];
    
    runningString = [runningString stringByAppendingString:buttonTitle];
    
    _displayLabel.text = runningString;
}

- (IBAction)operationPressed:(id)sender {
    NSString *buttonTitle = [(UIButton *) sender currentTitle];
    
    operation = buttonTitle;
    
    if ([operation isEqualToString:@"x"]){
        runningString = [runningString stringByAppendingString: @" "];
        runningString = [runningString stringByAppendingString: @"*"];
        runningString = [runningString stringByAppendingString: @" "];
    }
    else{
        runningString = [runningString stringByAppendingString: @" "];
        runningString = [runningString stringByAppendingString: operation];
        runningString = [runningString stringByAppendingString: @" "];
    }
    _displayLabel.text = runningString;
}

- (IBAction)clearButtonPressed:(id)sender {
    _displayLabel.text = @"0";
    runningString = @"";
}

- (IBAction)equalbuttonPressed:(id)sender {
    NSExpression *expression = [NSExpression expressionWithFormat: runningString];

    id result = [expression expressionValueWithObject:nil context:nil];
    
    _displayLabel.text = [NSString stringWithFormat:@"%@", result];
    runningString = [NSString stringWithFormat:@"%@", result];
}

@end
