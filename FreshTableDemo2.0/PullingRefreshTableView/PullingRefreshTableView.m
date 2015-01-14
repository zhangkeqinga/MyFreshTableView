//
//  PullingRefreshTableView.m
//  FreshTableDemo2.0
//
//  Created by Dong on 15-1-7.
//  Copyright (c) 2015年 jhony. All rights reserved.
//

#define kPROffsetY     60.f
#define kPRMargin      5.f
#define kPRLabelHeight 20.f
#define kPRLabelWidth  100.f
#define kPRArrowWidth  20.f
#define kPRArrowHeight 40.f

#import "PullingRefreshTableView.h"

@implementation PullingRefreshTableView

@synthesize autoScrollToNextPage;
@synthesize pullingDelegate = _pullingDelegate;
@synthesize reachedTheEnd = _reachedTheEnd;
@synthesize headerOnly = _headerOnly;



- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        _headerView =[[PullingHeaderView alloc]initWithFrame:CGRectMake(0, -60, 320, 60)];
        _headerView.backgroundColor=[UIColor whiteColor];
        
        [self addSubview:_headerView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame pullingDelegate:(id<PullingRefreshTableViewDelegate>)aPullingDelegate {
    self = [self initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.pullingDelegate = aPullingDelegate;
        
    }
    return self;
}




- (void)tableViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGSize size = scrollView.frame.size;
    CGSize contentSize = scrollView.contentSize;
    float yMargin = offset.y + size.height - contentSize.height; //状态的判断
//    NSLog(@"滑动yMargin=%.1f",yMargin);

    if (_headerView.state == kPRStateLoading || _footerView.state == kPRStateLoading) {
        return;
    }

    if (yMargin<-40) {  //-40(1.5)  -60(-0.5)
        _headerView.circle_d=1.5+(yMargin+40)/10;
        [_headerView setNeedsDisplay];
    }
    if(yMargin>-40 && yMargin<0 ){
        _headerView.circle_d=1.5;
        [_headerView setNeedsDisplay];
    }

    
    NSLog(@"offset.y==%f",offset.y);

    if (offset.y < -kPROffsetY) {                       //header totally appeard
        _headerView.state = kPRStatePulling;
        
        NSLog(@"2正在拖动_headerView。。。kPRStatePulling");
        
        
    } else if (offset.y > -kPROffsetY && offset.y < 0){ //header part appeared
        _headerView.state = kPRStateNormal;
        
        NSLog(@"2正在拖动_headerView。。。kPRStateNormal");
        
        
    } else if ( yMargin > kPROffsetY){                  //footer totally appeared
        if (_footerView.state != kPRStateHitTheEnd) {
            _footerView.state = kPRStatePulling;
            
            NSLog(@"2正在拖动_footerView。。。kPRStatePulling");
            
        }
    } else if ( yMargin < kPROffsetY && yMargin > 0) {  //footer part appeared
        if (_footerView.state != kPRStateHitTheEnd) {
            _footerView.state = kPRStateNormal;
            
            NSLog(@"2正在拖动_footerView。。。kPRStateNormal");
            
        
        }
    }
}

- (void)tableViewDidEndDragging:(UIScrollView *)scrollView{
    
    if (_headerView.state == kPRStateLoading || _footerView.state == kPRStateLoading) {
        return;
    }
    
    
    
    
    //test
    if (_footerView.state == kPRStateNormal || _headerView.state == kPRStateNormal) {
        self.contentInset = UIEdgeInsetsMake(kPROffsetY, 0, 0, 0);
    }
    [self performSelector:@selector(loadDatas) withObject:nil afterDelay:3.f];

    
}

- (void)loadDatas{
    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - tableView加载完成
- (void)tableViewDidFinishedLoading {
    [self tableViewDidFinishedLoadingWithMessage:nil];
}

#pragma mark - tableView 显示加载信息
- (void)tableViewDidFinishedLoadingWithMessage:(NSString *)msg{
    
    


       NSLog(@"tableViewDidFinishedLoadingWithMessage");
    
}

- (void)launchRefreshing{

}


@end
