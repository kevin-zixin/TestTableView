//
//  ViewController.m
//  TestTableView
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import <Masonry.h>
@import Contacts;
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
    
    
    UIButton *goTable = [[UIButton alloc]init];
    goTable.backgroundColor = [UIColor greenColor];
    [goTable addTarget:self action:@selector(goTableButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goTable];
    
    [goTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_testLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(40);
        make.right.equalTo(self.view).with.offset(-40);
        make.height.mas_equalTo(40);
    }];
    
    
    [self checkContact];
}


-(void)goTableButtonClicked{
    TestViewController *table = [[TestViewController alloc]init];
    [self.navigationController pushViewController:table animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - checkContact
-(void)checkContact{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    CNContactStore *store = [[CNContactStore alloc]init];
    if (status == CNAuthorizationStatusDenied) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }else if (status == CNAuthorizationStatusAuthorized){
        [self fetchContactData];

    }else if (status == CNAuthorizationStatusRestricted){
        
    }else if (status == CNAuthorizationStatusNotDetermined){
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            [self fetchContactData];
        }];
    }
}

-(void)fetchContactData{
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc]initWithKeysToFetch:@[[CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName],CNContactPhoneNumbersKey]];
    CNContactStore *store = [[CNContactStore alloc]init];
    NSError *error;
    [store enumerateContactsWithFetchRequest:request error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {

//        [contact.phoneNumbers enumerateObjectsUsingBlock:^(CNLabeledValue<CNPhoneNumber *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"%lu ________________%@",(unsigned long)idx,obj.value.stringValue);
//        }];
//
        if (contact.phoneNumbers.count>0) {
            CNLabeledValue<CNPhoneNumber *> *phoneNum = contact.phoneNumbers[0];
            NSLog(@"name:%@    number:%@",contact.givenName,[phoneNum.value.stringValue stringByReplacingOccurrencesOfString:@"-" withString:@""]);
        }

        
    }];
}

@end
