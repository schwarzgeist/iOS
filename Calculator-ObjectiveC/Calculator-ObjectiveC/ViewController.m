//
//  ViewController.m
//  Calculator-ObjectiveC
//
//  Created by Anthony Walker on 8/16/15.
//  Copyright (c) 2015 Anthony Walker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    //NSString *displayStack;
}

@property (weak, nonatomic) IBOutlet UILabel *display;

@end

@implementation ViewController

int firstNumber = 0;
int secondNumber = 0;
int runningTotal = 0;
NSString *operation = @"";
NSString *displayStack = @"";

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
    int number = [buttonTitle intValue];
    
    [self appendNumber:number];
    
    _display.text = displayStack;
    //_display.text = [NSString stringWithFormat:@"%d", number];
}
- (IBAction)operationPressed:(id)sender {
    NSString *buttonTitle = [(UIButton *) sender currentTitle];
    
    if ([buttonTitle  isEqual: @"+"])
        operation = @"+";
    else if ([buttonTitle isEqual: @"-"])
        operation = @"-";
    else if ([buttonTitle isEqual: @"/"])
        operation = @"/";
    else if ([buttonTitle isEqual: @"x"])
        operation = @"x";
    
    firstNumber = [displayStack intValue];
    displayStack = @"0";
    
}
- (IBAction)equalsPressed:(id)sender {
    int result = 0;
    
    if (![operation isEqual:NULL]){
        secondNumber = [displayStack intValue];
        if ([operation isEqual: @"+"]){
            result = firstNumber + secondNumber;
            runningTotal = runningTotal + result;
        }
        else if ([operation isEqual: @"-"]){
            result = firstNumber - secondNumber;
            runningTotal = runningTotal - result;
        }
        else if ([operation isEqual: @"x"]){
            result = firstNumber * secondNumber;
            runningTotal = runningTotal * result;
        }
        else if ([operation isEqual: @"/"]){
            result = firstNumber / secondNumber;
            runningTotal = runningTotal / result;
        }
        
        _display.text = [NSString stringWithFormat: @"%d", result];
        displayStack = [NSString stringWithFormat: @"%d", result];
//        if (runningTotal == 0){
//            runningTotal = result;
//        } else {
//            runningTotal = runningTotal + result;
//        }
    }
}

-(void)appendNumber:(int)number{
    if (displayStack == NULL)
        displayStack = @"0";
    if ([displayStack isEqual:@"0"])
        displayStack = @"";
    displayStack = [NSString stringWithFormat:@"%1$@%2$d", displayStack, number];
}
- (IBAction)clearButton:(id)sender {
    runningTotal = 0;
    displayStack = 0;
    _display.text = @"0";
}

@end
