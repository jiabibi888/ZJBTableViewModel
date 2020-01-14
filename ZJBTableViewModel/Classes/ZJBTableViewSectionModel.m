//
//  ZJBTableViewSectionModel.m
//  Jabir
//
//  Created by zjb on 16/11/8.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import "ZJBTableViewSectionModel.h"

@implementation ZJBTableViewSectionModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerHeight = UITableViewAutomaticDimension;
        self.footerHeight = UITableViewAutomaticDimension;
        self.cellModelArray = [NSMutableArray array];
    }
    return self;
}

@end
