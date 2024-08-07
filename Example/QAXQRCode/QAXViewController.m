//
//  QAXViewController.m
//  QAXQRCode
//
//  Created by dufangyi on 08/06/2024.
//  Copyright (c) 2024 dufangyi. All rights reserved.
//

#import "QAXViewController.h"
#import "SGQRCode.h"
#import "QAXQRCodeVC.h"
@interface QAXViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation QAXViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor cyanColor];
    [super viewDidLoad];
    
    [self configTableView];
}

- (void)configTableView {
    _dataList = @[@"开始扫码"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _dataList[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (UIViewController *)topViewControler{
    //获取根控制器
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *parent = root;
    while ((parent = root.presentedViewController) != nil ) {
        root = parent;
    }
    return root;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [SGPermission permissionWithType:SGPermissionTypeCamera completion:^(SGPermission * _Nonnull permission, SGPermissionStatus status) {
        if (status == SGPermissionStatusNotDetermined) {
            [permission request:^(BOOL granted) {
                if (granted) {
                    NSLog(@"第一次授权成功");
                    UIViewController *VC;
//                    if (indexPath.row == 0) {
//                        VC = [[WCQRCodeVC alloc] init];
//                    } else if (indexPath.row == 1) {
//                        VC = [[QQQRCodeVC alloc] init];
//                    } else if (indexPath.row == 2) {
//                        VC = [[XCQRCodeVC alloc] init];
//                    } else if (indexPath.row == 3) {
//                        VC = [[WBQRCodeVC alloc] init];
//                    }  else if (indexPath.row == 4) {
//                        VC = [[QAXQRCodeVC alloc] init];
//                    }
                    VC = [[QAXQRCodeVC alloc] init];
                    [self.navigationController pushViewController:VC animated:YES];
                    UIViewController *topViewCtrl = [self topViewControler];
                    [VC didMoveToParentViewController:topViewCtrl];

                    
                } else {
                    NSLog(@"第一次授权失败");
                }
            }];
        } else if (status == SGPermissionStatusAuthorized) {
            NSLog(@"SGPermissionStatusAuthorized");
            UIViewController *VC;
//            if (indexPath.row == 0) {
//                VC = [[WCQRCodeVC alloc] init];
//            } else if (indexPath.row == 1) {
//                VC = [[QQQRCodeVC alloc] init];
//            } else if (indexPath.row == 2) {
//                VC = [[XCQRCodeVC alloc] init];
//            } else if (indexPath.row == 3) {
//                VC = [[WBQRCodeVC alloc] init];
//            }
//            else if (indexPath.row == 4) {
//                VC = [[QAXQRCodeVC alloc] init];
//            }
            VC = [[QAXQRCodeVC alloc] init];

            [self.navigationController pushViewController:VC animated:YES];
            
        } else if (status == SGPermissionStatusDenied) {
            NSLog(@"SGPermissionStatusDenied");
            [self failed];
        } else if (status == SGPermissionStatusRestricted) {
            NSLog(@"SGPermissionStatusRestricted");
            [self unknown];
        }
        
    }];
    
}

- (void)failed {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"[前往：设置 - 隐私 - 相机 - SGQRCode] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertC addAction:alertA];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertC animated:YES completion:nil];
    });
}

- (void)unknown {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertC animated:YES completion:nil];
    });
}


@end
