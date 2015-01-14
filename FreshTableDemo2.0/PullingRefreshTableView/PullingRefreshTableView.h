//
//  PullingRefreshTableView.h
//  FreshTableDemo2.0
//
//  Created by Dong on 15-1-7.
//  Copyright (c) 2015年 jhony. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PullingHeaderView.h"
#import "PullingFootView.h"



#pragma mark - PullingRefreshTableView
@protocol PullingRefreshTableViewDelegate;

@interface PullingRefreshTableView : UITableView
{
    PullingHeaderView *_headerView;
    PullingFootView   *_footerView;
  
    UILabel *_msgLabel;
    BOOL _loading;
    BOOL _isFooterInAction;
    NSInteger _bottomRow;

    
    
}

@property (nonatomic,assign) id <PullingRefreshTableViewDelegate> pullingDelegate;

@property (nonatomic) BOOL autoScrollToNextPage;
@property (nonatomic) BOOL reachedTheEnd;
@property (nonatomic,getter = isHeaderOnly) BOOL headerOnly;


- (id)initWithFrame:(CGRect)frame pullingDelegate:(id<PullingRefreshTableViewDelegate>)aPullingDelegate;

- (void)tableViewDidScroll:(UIScrollView *)scrollView;          //tableview拖动中
- (void)tableViewDidEndDragging:(UIScrollView *)scrollView;     //tableview拖动结束
- (void)tableViewDidFinishedLoading;                            //
- (void)tableViewDidFinishedLoadingWithMessage:(NSString *)msg; //
- (void)launchRefreshing;

@end



@protocol PullingRefreshTableViewDelegate <NSObject>

@required

- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView;

@optional

//Implement this method if headerOnly is false
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView;

//Implement the follows to set date you want,Or Ignore them to use current date
- (NSDate *)pullingTableViewRefreshingFinishedDate;
- (NSDate *)pullingTableViewLoadingFinishedDate;

@end
