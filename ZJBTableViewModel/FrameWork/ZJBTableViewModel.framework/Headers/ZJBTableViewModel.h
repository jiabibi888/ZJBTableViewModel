//
//  ZJBTableViewModel.h
//  ZJBTableViewModel
//
//  Created by Jabir-Zhang on 2020/1/14.
//  Copyright © 2020 ZJBTableViewModel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//! Project version number for ZJBTableViewModel.
FOUNDATION_EXPORT double ZJBTableViewModelVersionNumber;

//! Project version string for ZJBTableViewModel.
FOUNDATION_EXPORT const unsigned char ZJBTableViewModelVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <ZJBTableViewModel/PublicHeader.h>

#import <ZJBTableViewModel/ZJBTableViewSectionModel.h>
typedef void (^ZJBTableViewScrollerViewBlock)(UIScrollView *scrollView);
typedef UIView * (^ZJBTableViewScrollerViewZoomingViewBlock)(UIScrollView *scrollView);
typedef void (^ZJBTableViewScrollerViewDraggingBlock)(UIScrollView *scrollView, BOOL decelerate );
typedef void (^ZJBTableViewScrollerViewBeginZoomingBlock)(UIScrollView *scrollView, UIView *view );
typedef void (^ZJBTableViewScrollerViewDidEndZoomingBlock)(UIScrollView *scrollView, UIView *view,CGFloat scale);
typedef void (^ZJBTableViewScrollerViewWillEndDraggingBlock)(UIScrollView *scrollView, CGPoint view,CGPoint  *targetContentOffset);
typedef void (^ZJBTableViewSectionIndexBlock)(UITableView *tableView, NSString *title, NSInteger index);
typedef void (^ZJBTableViewWillDisplayHeaderViewBlock)(UITableView *tableView, UIView *view, NSInteger section);

@interface ZJBTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray<ZJBTableViewSectionModel *> *sectionModelArray;

@property (nonatomic, assign) BOOL bShowIndex;
@property (nonatomic, strong) NSMutableArray *aIndexTitle;

#pragma mark - ScrollView
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock didScrollBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock didZoomlBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock willBeginDraggingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewWillEndDraggingBlock willEndDraggingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewDraggingBlock didEndDraggingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock willBeginDeceleratingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock didEndDeceleratingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock didEndScrollingAnimationBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewZoomingViewBlock zoomingViewBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBeginZoomingBlock willBeginZoomingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewDidEndZoomingBlock didEndZoomingBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock shouldScrollToTopBlock;    // optional
@property (nonatomic, copy) ZJBTableViewScrollerViewBlock didScrollToTopBlock;    // optional
@property (nonatomic, copy) ZJBTableViewSectionIndexBlock sectionIndexBlock;    // optional
@property (nonatomic, copy) ZJBTableViewWillDisplayHeaderViewBlock willDisplayHeaderViewBlock;    // optional

@end


