//
//  TestViewController.m
//  TestTableView
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TestViewController.h"
#import <Masonry.h>
#import "TestTableViewCell.h"
extern

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc]init];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 100;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UINib *cellNib = [UINib nibWithNibName:@"TestTableViewCell" bundle:nil];
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"test"];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.view);
    }];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (indexPath.row==0) {
        cell.kvLabel.text = @"setting";
    }else if (indexPath.row==1){
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
