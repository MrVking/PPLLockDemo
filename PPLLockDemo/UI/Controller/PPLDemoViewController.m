//
//  PPLDemoViewController.m
//  PPLLockDemo
//
//  Created by Samuel on 2019/1/12.
//  Copyright © 2019年 Populstay. All rights reserved.

#import "PPLDemoViewController.h"
#import "PPLKeyboardPasswordController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface PPLDemoViewController ()
@end

@implementation PPLDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = _model.name;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Password" style:UIBarButtonItemStyleDone target:self action:@selector(keyboardPwdAction)];

}

- (IBAction)unlock:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        if (succeed) {
            
            [PPLLockHelper unlock:self->_model unlockBlock:^(BOOL succeed, id info) {
                
                [self showOperationSuccessToast];
                
            }];
            
        }
        
        
    } ];
}
- (IBAction)lock:(UIButton *)sender {
  
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        if (succeed) {
            
            [PPLLockHelper lock:self->_model lockBlock:^(BOOL succeed, id info) {
               
                if (succeed) {
                   
                    [self showOperationSuccessToast];
                    
                }
                
            }];
            
        }
        
        
    } ];
    
}
- (IBAction)readRecord:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        if (succeed) {
            
            [PPLLockHelper pullUnlockRecord:self->_model complition:^(BOOL succeed, id info) {
               
                if (succeed) {
                    
                    [self showOperationSuccessToast];
                }
                
            }];
            
        }
        
        
    } ];
    
}
- (IBAction)readLockTime:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        if (succeed) {
            
            [PPLLockHelper GetLockTimeComplition:^(BOOL succeed, id info) {
            
                if (succeed) {

                    [self showOperationSuccessToast];
                    
                    NSLog(@"info = %@",info);
                    
                }
                
                
            }];
            
        }
        
        
    } ];
}
- (IBAction)setLockTime:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    weakify(self)
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        strongify(self)
        
        if (succeed) {
            
            [PPLLockHelper setLockTime:self->_model complition:^(BOOL succeed, id info) {
                
                if (succeed) {
                    
                       [self showOperationSuccessToast];
                }
                
                
            }];
            
        }
        
        
    } ];
    
}
- (IBAction)setAutolocking:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        if (succeed) {
            
            [PPLLockHelper setAutoLockingTime:5 key:self->_model complition:^(BOOL succeed, id info) {
                
                if (succeed) {
                    
                     [self showOperationSuccessToast];
                }
                
                
            }];
            
        }
        
        
    } ];
    
}
- (IBAction)openAndCloseAutoLock:(UISwitch *)sender {
    
    int time;
    
    if (sender.isOn) {
        
        time = 5;
        
    }else {
        
        time = 0;
    }
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        if (succeed) {
            
            [PPLLockHelper setAutoLockingTime:time key:self->_model complition:^(BOOL succeed, id info) {
                
                if (succeed) {
                    
                    [self showOperationSuccessToast];
                }
                
                
            }];
            
        }
        
        
    } ];
    
    
}


- (IBAction)resetLockAction:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    weakify(self)

    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        strongify(self)
        
        if (succeed) {
            
            [PPLLockHelper resetLock:self->_model complition:^(BOOL succeed, id info) {
                
                if (succeed) {
                    
                    [self showOperationSuccessToast];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }
                
            }];
            
        }
        
    }];
    
}

#pragma mark ---- 时间戳转换为NSDate
- (NSDate *)timestampForDate:(NSTimeInterval)timeInterval
{
    NSTimeInterval time = timeInterval / 1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time];
    
    return date;
}

//- (void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    PPLObjectPPLLockHelper.delegate = nil;
//    //[PPLObjectPPLLockHelper startScan];
//}

- (IBAction)readLockInfoAction:(UIButton *)sender {
    
    if (!_model) {
        
        [self showToast:@"Lock data is empty"];
        
        return;
    }
    
    weakify(self)
    
    [SVProgressHUD show];
    
    [PPLLockHelper connectKey:_model connectBlock:^(BOOL succeed, id info) {
        
        [SVProgressHUD dismiss];
        
        strongify(self)
        
        if (succeed) {
            
            [PPLLockHelper GetDeviceInfoBlock:^(BOOL succeed, id info) {
                
                if (succeed) {
                    
                    NSLog(@"info = %@",info);
                    
                    [self showOperationSuccessToast];
                    
                }
                
            }];
            
        }
        
    }];
}

- (void)keyboardPwdAction
{
    PPLKeyboardPasswordController * keyboardPasswordVC = [[PPLKeyboardPasswordController alloc] init];
    
    keyboardPasswordVC.model = _model;
    
    [self.navigationController pushViewController:keyboardPasswordVC animated:YES];
}

@end
