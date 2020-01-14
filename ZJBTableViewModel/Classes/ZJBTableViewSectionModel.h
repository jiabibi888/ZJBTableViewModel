//
//  ZJBTableViewSectionModel.h
//  Jabir
//
//  Created by zjb on 16/11/8.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBTableViewCellModel.h"
#import <UIKit/UIKit.h>

typedef UIView * (^ZJBViewRenderBlock)(NSInteger section, UITableView *tableView);

@interface ZJBTableViewSectionModel : NSObject
@property (nonatomic, strong) NSMutableArray<ZJBTableViewCellModel *> *cellModelArray;
@property (nonatomic, strong) NSString *headerTitle;  // optional
@property (nonatomic, strong) NSString *footerTitle;  // optional
@property (nonatomic, assign) CGFloat headerHeight;  // optional
@property (nonatomic, assign) CGFloat footerHeight;  // optional

@property (nonatomic, copy) ZJBViewRenderBlock headerViewRenderBlock;//block for headerview
@property (nonatomic, copy) ZJBViewRenderBlock footerViewRenderBlock;//block for footerview

@property (nonatomic, strong) UIView *headerView;  // section header view
@property (nonatomic, strong) UIView *footerView;  // section footer view

@end
