//
//  TestTableViewCell.h
//  TestTableView
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *kvLabel;
@property (weak, nonatomic) IBOutlet UIImageView *kvImage;

@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@end
