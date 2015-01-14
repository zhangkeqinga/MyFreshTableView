//
//  BasedPullingview.h
//  FreshTableDemo2.0
//
//  Created by Dong on 15-1-7.
//  Copyright (c) 2015年 jhony. All rights reserved.
//

#define kPRAnimationDuration 2

typedef enum {
    kPRStateNormal = 0,   // header footer part appeared
    kPRStatePulling = 1,  // header footer totally appeared
    kPRStateLoading = 2,  // 加载数据 请求中
    kPRStateHitTheEnd = 3 //
} PRState;



#import <UIKit/UIKit.h>

@interface BasedPullingview : UIView
{
    UILabel  *_stateLabel;                        // 上下拉提示
    NSString *_dateString;                        // 时间的提示

    BOOL _loading;
    UIActivityIndicatorView *_activityView;       //

}

@property (nonatomic,getter = isLoading) BOOL loading;  // 是否在加载数据中
@property (nonatomic,getter = isAtTop)   BOOL atTop;    // 是否在顶部
@property (nonatomic) PRState state;                    // tableView 当前的状态

- (void)setState:(PRState)state animated:(BOOL)animated;

@end
