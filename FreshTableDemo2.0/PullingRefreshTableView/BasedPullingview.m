//
//  BasedPullingview.m
//  FreshTableDemo2.0
//
//  Created by Dong on 15-1-7.
//  Copyright (c) 2015年 jhony. All rights reserved.
//

#import "BasedPullingview.h"

@implementation BasedPullingview

@synthesize loading;

@synthesize state = _state;
@synthesize atTop = _atTop;


- (void)setState:(PRState)state {
    [self setState:state animated:YES];
}


- (void)setState:(PRState)state animated:(BOOL)animated{
//    float duration = animated ? kPRAnimationDuration : 0.f;
    if (_state != state) {
        _state = state;
        if (_state == kPRStateLoading) {    //Loading
            
            [_activityView startAnimating];
            
            _loading = YES;
            if (self.isAtTop) {
                _stateLabel.text = NSLocalizedString(@"正在刷新", @"");
            } else {
                _stateLabel.text = NSLocalizedString(@"正在加载", @"");
            }
            
            
        } else if (_state == kPRStatePulling && !_loading) {    //Scrolling
            
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
            if (self.isAtTop) {
                _stateLabel.text = NSLocalizedString(@"释放刷新", @"");
            } else {
                _stateLabel.text = NSLocalizedString(@"释放加载更多", @"");
            }
            
        } else if (_state == kPRStateNormal && !_loading){    //Reset
            
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
    
            
            if (self.isAtTop) {
                _stateLabel.text = NSLocalizedString(@"下拉刷新", @"");
            } else {
                _stateLabel.text = NSLocalizedString(@"上拉加载更多", @"");
            }
            
            
        } else if (_state == kPRStateHitTheEnd) {
            if (!self.isAtTop) {    //footer
                _stateLabel.text = NSLocalizedString(@"已经是最后一条", @"");
            }
        } else{
            
            
        }
        
        
    }
    
    //    NSLog(@"setState:(PRState)state");
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
