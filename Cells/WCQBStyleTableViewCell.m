//
//  WCQBStyleTableViewCell.m
//  FactoryDemo
//
//  Created by wcq on 2017/12/25.
//  Copyright © 2017年 wcq. All rights reserved.
//

#import "WCQBStyleTableViewCell.h"

@implementation WCQBStyleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configUI:(id)model {
    
    self.textLabel.text = NSStringFromClass([self class]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
