//
//  TestTableViewCell.m
//  TestTableView
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _kvImage.backgroundColor = [UIColor redColor];
    _kvLabel.text = @"这是一条测试信息,这是一条测试信息,这是一条测试信息,这是一条测试信息,这是一条测试信息,这是一条测试信息,这是一条测试信息,这是一条测试信息";
    _bottomLabel.text=@"这是最后,这是最后";
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
