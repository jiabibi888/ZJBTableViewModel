//
//  ZJBTableViewModel.m
//  Jabir
//
//  Created by zjb on 16/11/8.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import "ZJBTableViewModel.h"

@implementation ZJBTableViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.sectionModelArray = [NSMutableArray array];
    }
    return self;
}

- (ZJBTableViewSectionModel*)sectionModelAtSection:(NSInteger)section {
    @try {
        ZJBTableViewSectionModel *sectionModel = self.sectionModelArray[section];
        return sectionModel;
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (ZJBTableViewCellModel*)cellModelAtIndexPath:(NSIndexPath *)indexPath {
    @try {
        ZJBTableViewSectionModel *sectionModel = self.sectionModelArray[indexPath.section];
        ZJBTableViewCellModel *cellModel = sectionModel.cellModelArray[indexPath.row];
        return cellModel;
    }
    @catch (NSException *exception) {
        return nil;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellHeightBlock heightBlock = cellModel.heightBlock;
    if (heightBlock) {
        return heightBlock(indexPath,tableView);
    }else {
        return cellModel.height;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
//    if (self.bShowIndex) {
//        [self.aIndexTitle addObject:sectionModel.headerTitle.length>0 ? sectionModel.headerTitle : @""];
//    }
    return sectionModel.headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.footerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    ZJBViewRenderBlock headerViewRenderBlock = sectionModel.headerViewRenderBlock;
    if (headerViewRenderBlock) {
        return headerViewRenderBlock(section, tableView);
    } else {
        return sectionModel.headerView;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    ZJBViewRenderBlock footerViewRenderBlock = sectionModel.footerViewRenderBlock;
    if (footerViewRenderBlock) {
        return footerViewRenderBlock(section, tableView);
    } else {
        return sectionModel.footerView;
    }
}
- (nullable NSIndexPath *)tableView:(UITableView *)tableView
           willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellWillSelectBlock willSelectBlock = cellModel.willSelectBlock;
    if (willSelectBlock) {
        return willSelectBlock(indexPath, tableView);
    }
    return indexPath;
}
- (nullable NSIndexPath *)tableView:(UITableView *)tableView
         willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellWillSelectBlock willDeselectBlock = cellModel.willDeselectBlock;
    if (willDeselectBlock) {
        return willDeselectBlock(indexPath, tableView);
    }
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellSelectionBlock selectionBlock = cellModel.selectionBlock;
    if (selectionBlock) {
        selectionBlock(indexPath, tableView);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellSelectionBlock deselectionBlock = cellModel.deselectionBlock;
    if (deselectionBlock) {
        deselectionBlock(indexPath, tableView);
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    if(cellModel.deleteConfirmationButtonTitle.length > 0){
        return cellModel.deleteConfirmationButtonTitle;
    }
    return @"删除";
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    NSArray *array = nil;
    ZJBCellEditActionsBlock editActionsBlock = cellModel.editActionsBlock;
    if (editActionsBlock) {
        array = editActionsBlock(indexPath, tableView);
    }
    return array;
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellSelectionBlock beginEditingBlock = cellModel.beginEditingBlock;
    if (beginEditingBlock) {
        beginEditingBlock(indexPath, tableView);
    }
}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath{
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellSelectionBlock endEditingBlock = cellModel.endEditingBlock;
    if (endEditingBlock) {
        endEditingBlock(indexPath, tableView);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if (self.willDisplayHeaderViewBlock) {
        self.willDisplayHeaderViewBlock(tableView, view, section);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionModelArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.cellModelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    UITableViewCell *cell = nil;
    ZJBCellRenderBlock renderBlock = cellModel.renderBlock;
    if (renderBlock) {
        cell = renderBlock(indexPath, tableView);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellWillDisplayBlock willDisplayBlock = cellModel.willDisplayBlock;
    if (willDisplayBlock) {
        willDisplayBlock(cell, indexPath, tableView);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.headerTitle;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    ZJBTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.footerTitle;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.canEdit;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.editingStyle;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJBTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    ZJBCellCommitEditBlock commitEditBlock = cellModel.commitEditBlock;
    if (commitEditBlock) {
        commitEditBlock(indexPath, editingStyle, tableView);
    }
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.aIndexTitle;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    if (self.sectionIndexBlock) {
        self.sectionIndexBlock(tableView, title, index);
    }
    if (self.bShowIndex) {
        return index;
    } else {
        return NSNotFound;
    }
}

#pragma mark -  UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(self.didScrollBlock){
        self.didScrollBlock(scrollView);
    }
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    if(self.didZoomlBlock){
        self.didZoomlBlock(scrollView);
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if(self.willBeginDraggingBlock){
        self.willBeginDraggingBlock(scrollView);
    }
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (self.willEndDraggingBlock) {
        self.willEndDraggingBlock(scrollView, velocity, targetContentOffset);
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(self.didEndDraggingBlock){
        self.didEndDraggingBlock(scrollView, decelerate);
    }
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if(self.willBeginDeceleratingBlock){
        self.willBeginDeceleratingBlock(scrollView);
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(self.didEndDeceleratingBlock){
        self.didEndDeceleratingBlock(scrollView);
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if(self.didEndScrollingAnimationBlock){
        self.didEndScrollingAnimationBlock(scrollView);
    }
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    if(self.zoomingViewBlock){
      return   self.zoomingViewBlock(scrollView);
    }
    return nil;// return a view that will be scaled. if delegate returns nil, nothing happens
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    if(self.willBeginZoomingBlock){
       self.willBeginZoomingBlock(scrollView, view);
    }
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    if(self.didEndZoomingBlock){
        self.didEndZoomingBlock(scrollView, view, scale);
    }
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    if(self.shouldScrollToTopBlock){
        self.shouldScrollToTopBlock(scrollView);
    }
    return YES;//  return a yes if you want to scroll to the top. if not defined, assumes YES
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    if(self.didScrollToTopBlock){
        self.didScrollToTopBlock(scrollView);
    }
}

#pragma mark - getters and setters
- (NSMutableArray *)aIndexTitle{
    if (!_aIndexTitle) {
        _aIndexTitle = [[NSMutableArray alloc] init];
    }
    return _aIndexTitle;
}
@end
