//
//  PPLDeviceCell.m
//  PPLLockDemo
//  Created by Samuel on 2019/1/10.
//  Copyright © 2019年 Populstay. All rights reserved.

#import "PPLDeviceCell.h"

@implementation PPLDeviceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.addImageV.tintColor = [UIColor colorThemeColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
}

@end
