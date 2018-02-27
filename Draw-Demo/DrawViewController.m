//
//  DrawViewController.m
//  Draw-Demo
//
//  Created by yq on 2018/2/2.
//  Copyright © 2018年 yq. All rights reserved.
//

#import "DrawViewController.h"

@interface DrawViewController ()

@end

#define kDefaultFrame CGRectMake(100, 100, 100, 100)
@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    SEL selector = NSSelectorFromString(self.navigationItem.title);
    IMP imp = [self methodForSelector:selector];
    void (*func)(id, SEL) = (void *)imp;
    func(self, selector);
    
//    [self performSelector:NSSelectorFromString(self.navigationItem.title) withObject:nil];
}

- (void)drawSolidRectangular {
    NSLog(@"画矩形");
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = kDefaultFrame;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawHollowRectangular {
    NSLog(@"画空心矩形");
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:kDefaultFrame];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    //* 设置路径 */
    layer.path = path.CGPath;
    //* 设置填充色 */
    layer.fillColor = [UIColor orangeColor].CGColor;
    //* 设置边框色 */
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawRoundedCornerRadiusShape {
    NSLog(@"画圆角图形");
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:kDefaultFrame cornerRadius:30];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawFanshaped {
    NSLog(@"画扇形");
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:50 startAngle:0 endAngle:M_PI/2 clockwise:YES];
    CGPoint centerPoint = self.view.center;
    [path addLineToPoint:centerPoint];
    [path closePath];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawbyRoundingCornersWithTopRight {
    NSLog(@"画圆角(右上)");
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:kDefaultFrame byRoundingCorners:UIRectCornerTopRight cornerRadii:kDefaultFrame.size];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawOval {
    NSLog(@"画椭圆");
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 100)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawCurve {
    NSLog(@"画曲线");
    CGPoint start = CGPointMake(100, 100);
    CGPoint end = CGPointMake(300, 300);
    CGPoint control = CGPointMake(200, 150);
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(start.x, start.y, 5, 5);
    layer1.backgroundColor = [UIColor orangeColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(control.x, control.y, 5, 5);
    layer2.backgroundColor = [UIColor orangeColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(end.x, end.y, 5, 5);
    layer3.backgroundColor = [UIColor orangeColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    [path addQuadCurveToPoint:end controlPoint:control];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    
    
    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:start];
    [path11 addLineToPoint:control];
    CAShapeLayer *layer11 = [CAShapeLayer layer];
    layer11.path = path11.CGPath;
    layer11.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer11];
    UIBezierPath *path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:control];
    [path12 addLineToPoint:end];
    CAShapeLayer *layer12 = [CAShapeLayer layer];
    layer12.path = path12.CGPath;
    layer12.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer12];
    
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer];
}

- (void)drawCurve2 {
    NSLog(@"画曲线2");
    CGPoint start = CGPointMake(50, 300);
    CGPoint end = CGPointMake(300, 300);
    CGPoint control = CGPointMake(170, 200);
    CGPoint control2 = CGPointMake(220, 400);
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(start.x, start.y, 5, 5);
    layer1.backgroundColor = [UIColor orangeColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(control.x, control.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(end.x, end.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer4 = [CALayer layer];
    layer4.frame = CGRectMake(control2.x, control2.y, 5, 5);
    layer4.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:start];
    
    [path addCurveToPoint:end controlPoint1:control controlPoint2:control2];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor orangeColor].CGColor;
    
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer4];
    [self.view.layer addSublayer:layer];
}

- (void)drawCurveWithAnimation {
    NSLog(@"动画绘制曲线");
//    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.fromValue = @0.0;
    ani.toValue = @1.0;
    ani.duration = 5;
    
    CGPoint starPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint = CGPointMake(170, 200);
    CGPoint controlPoint2 = CGPointMake(220, 400);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:starPoint];
    //* 两个控制点 */
    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint2];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    [layer addAnimation:ani forKey:nil];
    [self.view.layer addSublayer:layer];
}

- (void)drawCurveWithAnimation2 {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    ani.fromValue = @0.5;
    ani.toValue = @0.0;
    ani.duration = 2.0;
    
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani2.fromValue = @0.5;
    ani2.toValue = @1.0;
    ani2.duration = 2.0;
    
    CGPoint start = CGPointMake(50, 300);
    CGPoint end = CGPointMake(300, 300);
    CGPoint control = CGPointMake(170, 200);
    CGPoint control2 = CGPointMake(220, 400);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [path moveToPoint:start];
    
    //* 两个控制点 */
    [path addCurveToPoint:end controlPoint1:control controlPoint2:control2];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    [layer addAnimation:ani forKey:nil];
    [layer addAnimation:ani2 forKey:nil];
    [self.view.layer addSublayer:layer];
}

- (void)draw {
    CGSize finalSize = CGSizeMake(self.view.width, 300);
    CGFloat layerHeight = finalSize.height/2;
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    /** 左上点 */
    [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
    /** 左下点 */
    [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
    /** 右下点 */
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
    /** 右上点 */
    [path addLineToPoint:CGPointMake(finalSize.width, layerHeight)];
    
    [path addQuadCurveToPoint:CGPointMake(0, layerHeight) controlPoint:CGPointMake(self.view.width/2, layerHeight - 40)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)drawArcRectangular {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:kDefaultFrame cornerRadius:15];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(145, 101)];
    [path2 addLineToPoint:CGPointMake(150, 95)];
    [path2 addLineToPoint:CGPointMake(155, 101)];
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = path.CGPath;
    layer2.fillColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer2];
    layer2.path = path2.CGPath;
    [self.view.layer addSublayer:layer2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
