//
//  B_learnView.m
//  B_learn
//
//  Created by 陈威利 on 2022/9/14.
//

#import "B_learnView.h"

@implementation B_learnView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint: CGPointMake(50, 50)];
//    [path addLineToPoint: CGPointMake(150, 50)];
//    path.lineCapStyle = kCGLineCapButt;
//    path.lineWidth = 3;
//    [[UIColor redColor] set];
//    [path stroke];
//    [path closePath];
//    UIBezierPath *pathR = [UIBezierPath bezierPath];
//    pathR.lineWidth = 3;
//    pathR.lineCapStyle = kCGLineCapButt;
//    CGPoint center = CGPointMake(150, 50+25);
//    CGFloat radius = 25;
//    CGFloat startAngle = -M_PI*1.5; //
//    CGFloat endAngle = M_PI*1.5;
//    [[UIColor redColor] set];
//    [path moveToPoint:center];
//    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:NO];
//    [path stroke];
//    [pathR closePath];
    UIColor *color = [UIColor redColor];
        [color set]; //设置线条颜色
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 150) cornerRadius:20];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    [path stroke];
}
@end
