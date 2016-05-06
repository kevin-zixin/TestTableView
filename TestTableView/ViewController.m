//
//  ViewController.m
//  TestTableView
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableAttributedString *testStr;
@property(nonatomic,strong)UILabel *testLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _testLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 300, 40)];
    [self.view addSubview:_testLabel];
    NSString *str = @"123 abcd";
    _testStr = [[NSMutableAttributedString alloc]initWithString:str];
    [_testStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    
    
    [_testStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:[str rangeOfString:@"abcd"]];
    
    
    _testLabel.attributedText = _testStr;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
