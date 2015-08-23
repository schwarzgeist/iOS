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
int runningStringLength = 0;
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

//Appends the running string to whatever number is being pressed.
- (IBAction)numberPressed:(id)sender {
    NSString *buttonTitle = [(UIButton *) sender currentTitle];
    
    //Ensuring we don't have a leading zero
    if ([runningString isEqualToString:@"0"]){
        runningString = buttonTitle;
    }
    else{
        runningString = [runningString stringByAppendingString:buttonTitle];
    }
    
    _displayLabel.text = runningString;
}

//Depending on the operation, the overall expression is appended by the operation.
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

//Clears the fields and display
- (IBAction)clearButtonPressed:(id)sender {
    _displayLabel.text = @"0";
    runningString = @"";
}

//Evaluates whatever expression is currently in the running string and updates the value of the result
- (IBAction)equalbuttonPressed:(id)sender {
    //Saves application from crashing when user opens the app and just hits enter
    if ([runningString isEqualToString:@""]){
        runningString = @"0";
    }
    
    if (![runningString hasSuffix: @" + "]&&
       ![runningString hasSuffix: @" - "]&&
       ![runningString hasSuffix: @" * "]&&
       ![runningString hasSuffix: @" / "]){
        NSExpression *expression = [NSExpression expressionWithFormat: runningString];
        
        id result = [expression expressionValueWithObject:nil context:nil];
        
        _displayLabel.text = [NSString stringWithFormat:@"%@", result];
        runningString = [NSString stringWithFormat:@"%@", result];
    }

}

- (IBAction)deleteButton:(id)sender {
    runningStringLength = (int)[runningString length];
    //If the current expression is one digit, just set it to zero
    if (runningStringLength < 2){
        runningString = @"0";
    }
    //If the current expression ends with an operation, delete the operation
    else if ([runningString hasSuffix: @" + "]||
             [runningString hasSuffix: @" - "]||
             [runningString hasSuffix: @" * "]||
             [runningString hasSuffix: @" / "]){
        runningString = [runningString substringToIndex:runningStringLength - 3];
    }
    //Else, this is a multiple digit number, so just delete one number
    else{
        runningString = [runningString substringToIndex:runningStringLength - 1];
    }
    
    _displayLabel.text = runningString;
}

@end
