//
//  ViewController.h
//  FreshTableDemo2.0
//
//  Created by Dong on 15-1-7.
//  Copyright (c) 2015年 jhony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullingRefreshTableView.h"


@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PullingRefreshTableViewDelegate>
{
    PullingRefreshTableView *tableViewS;
    NSNumber *pageSizeNum;    //下拉刷新
    NSNumber *pageIndexNum;
    NSInteger pageIndex;
    NSInteger pageSize;
    NSInteger index_num;
    NSInteger select_num;     //下拉刷新
}

@property(nonatomic) BOOL                             refreshing;    //下拉刷新
@property(nonatomic,strong) NSMutableArray           *tableArray;
@property(nonatomic,retain) NSArray                  *dataRecordArr;
@property(nonatomic,retain) PullingRefreshTableView  *tableviewS;


@end

