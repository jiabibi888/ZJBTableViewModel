//
//  ZJBTableViewCellModel.h
//  Jabir
//
//  Created by zjb on 16/11/8.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef UITableViewCell * (^ZJBCellRenderBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef NSIndexPath * (^ZJBCellWillSelectBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef void (^ZJBCellSelectionBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef void (^ZJBCellWillDisplayBlock)(UITableViewCell *cell, NSIndexPath *indexPath, UITableView *tableView);
typedef void (^ZJBCellCommitEditBlock)(NSIndexPath *indexPath,  UITableViewCellEditingStyle editingStyle, UITableView *tableView);
typedef NSArray * (^ZJBCellEditActionsBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef CGFloat (^ZJBCellHeightBlock)(NSIndexPath *indexPath, UITableView *tableView);

@interface ZJBTableViewCellModel : NSObject

@property (nonatomic, copy) ZJBCellRenderBlock renderBlock;            // required
@property (nonatomic, copy) ZJBCellWillDisplayBlock willDisplayBlock;  // optional
@property (nonatomic, copy) ZJBCellWillSelectBlock willSelectBlock;    // optional
@property (nonatomic, copy) ZJBCellWillSelectBlock willDeselectBlock;  // optional
@property (nonatomic, copy) ZJBCellSelectionBlock selectionBlock;      // optional
@property (nonatomic, copy) ZJBCellSelectionBlock deselectionBlock;    // optional
@property (nonatomic, copy) ZJBCellSelectionBlock beginEditingBlock;    // optional
@property (nonatomic, copy) ZJBCellSelectionBlock endEditingBlock;    // optional
@property (nonatomic, copy) ZJBCellCommitEditBlock commitEditBlock;    // optional
@property (nonatomic, copy) ZJBCellHeightBlock heightBlock;    // optional
@property (nonatomic, copy) ZJBCellEditActionsBlock editActionsBlock;    // optional

@property (nonatomic, assign) CGFloat height;  // optional
@property (nonatomic, assign) BOOL canEdit;    // default NO
//@property (nonatomic, assign) BOOL canMove;   //default NO
@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;// default UITableViewCellEditingStyleNone
@property (nonatomic, copy) NSString *deleteConfirmationButtonTitle;// default 删除
@end
