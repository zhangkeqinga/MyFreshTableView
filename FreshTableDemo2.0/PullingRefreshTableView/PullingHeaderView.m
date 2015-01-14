//
//  PullingHeaderView.m
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

#import "PullingHeaderView.h"

@implementation PullingHeaderView

@synthesize circle_d;

//Default is at top
- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        circle_d=1.5;
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect    // -1.5-0.5-2.5    1.5-0.5- -0.5
{
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,0.5,0.5,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextAddArc(context, 100, 35, 15, 1.5*M_PI , circle_d*M_PI , -1); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor (context, 0, 0, 0, 1);
    UIFont  *font = [UIFont boldSystemFontOfSize:12];
    NSString *stringa1=@"下拉刷新...";
    NSString *stringb1=@"最后更新时间:刚刚";
    
    if (circle_d<=-0.5) {
        stringa1=@"释放刷新...";
    }
    
    [stringa1 drawInRect:CGRectMake(130, 17, 160, 20) withFont:font];
    [stringb1 drawInRect:CGRectMake(130, 38, 160, 20) withFont:font];
    
    
}



@end
















//
//- (void)layouts {
//    
//    
//    
//    //        _arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20) ];
//    //        _arrow = [CALayer layer];
//    //        _arrow.frame = CGRectMake(0, 0, 20, 20);
//    //        _arrow.contentsGravity = kCAGravityResizeAspect;
//    //        _arrow.contents = (id)[UIImage imageWithCGImage:[UIImage imageNamed:@"blueArrow.png"].CGImage scale:1 orientation:UIImageOrientationDown].CGImage;
//    //        [self.layer addSublayer:_arrow];
//    //
//    //        [self layouts];
//    
//    
//    CGSize size = self.frame.size;
//    CGRect stateFrame,dateFrame,arrowFrame;
//    
//    float x = 0,y,margin;
//    //    x = 0;
//    margin = (kPROffsetY - 2*kPRLabelHeight)/2;
//    
//    
//    if (self.isAtTop) {
//        
//        y = size.height - margin - kPRLabelHeight;
//        
//        dateFrame = CGRectMake(0,y,size.width,kPRLabelHeight);
//        
//        y = y - kPRLabelHeight;
//        stateFrame = CGRectMake(0, y, size.width, kPRLabelHeight);
//        
//        
//        x = kPRMargin;
//        y = size.height - margin - kPRArrowHeight;
//        arrowFrame = CGRectMake(4*x, y, kPRArrowWidth, kPRArrowHeight);
//        
//        UIImage *arrow = [UIImage imageNamed:@"blueArrow"];
//        _arrow.contents = (id)arrow.CGImage;
//        
//    } else {    //at bottom
//        
//        y = margin;
//        stateFrame = CGRectMake(0, y, size.width, kPRLabelHeight );
//        
//        y = y + kPRLabelHeight;
//        dateFrame = CGRectMake(0, y, size.width, kPRLabelHeight);
//        
//        x = kPRMargin;
//        y = margin;
//        arrowFrame = CGRectMake(4*x, y, kPRArrowWidth, kPRArrowHeight);
//        
//        UIImage *arrow = [UIImage imageNamed:@"blueArrowDown"];
//        _arrow.contents = (id)arrow.CGImage;
//    }
//    
//    _arrowView.frame = arrowFrame;
//    _arrow.frame = arrowFrame;
//    _arrow.transform = CATransform3DIdentity;
//    
//    NSLog(@"    _arrow.transform = CATransform3DIdentity;");
//}

