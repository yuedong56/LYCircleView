//
//  YRCircleProgressImageView.m
//  LYCircleView
//
//  Created by yuedongkui on 2019/11/20.
//  Copyright © 2019 LY. All rights reserved.
//

#import "YRCircleProgressImageView.h"

@interface YRCircleProgressImageView ()<CAAnimationDelegate>

@property (strong,nonatomic) CircleProgressLayer * circleProgressLayer;

@end



@implementation YRCircleProgressImageView

- (void)drawRect:(CGRect)rect
{
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.circleProgressLayer = [CircleProgressLayer layer];
        self.circleProgressLayer.frame = self.bounds;
        self.circleProgressLayer.contentsScale = [UIScreen mainScreen].scale;//像素大小比例
        [self.layer addSublayer:self.circleProgressLayer];
        
        [self setCircleColorWithR:0 g:0 b:0 a:1]; //默颜色黑色
        self.lineWidth = 1;
    }
    return self;
}

- (void)setCircleColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
{
    [self.circleProgressLayer setCircleColorWithR:r g:g b:b a:a];
}

#pragma mark - Setter
- (void)setProgress:(CGFloat)progress
{
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"progress"];
    ani.duration = 5.0 * fabs(progress - _progress);
    ani.toValue = @(progress);
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.delegate = self;
    [self.circleProgressLayer addAnimation:ani forKey:@"kProgressAniKey"];
    
    _progress = progress;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    
    self.circleProgressLayer.lineWidth = lineWidth;
}

#pragma CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.circleProgressLayer.progress = self.progress;
}

@end







@implementation CircleProgressLayer

/* 重载其绘图方法 drawInContext，并在progress属性变化时让其重绘 */
- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat radius = self.bounds.size.width / 2;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                         radius:radius-_lineWidth/2
                                                     startAngle:-M_PI/2
                                                       endAngle:M_PI*2 * self.progress - M_PI/2
                                                      clockwise:self.progress>0 ? YES : NO];
    CGContextSetRGBStrokeColor(ctx, _r, _g, _b, _a);//笔颜色
    CGContextSetLineWidth(ctx, _lineWidth);//线条宽度
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

- (instancetype)initWithLayer:(CircleProgressLayer *)layer
{
    if (self = [super initWithLayer:layer]) {
        self.progress = layer.progress;
        self.r = layer.r;
        self.g = layer.g;
        self.b = layer.b;
        self.a = layer.a;
        self.lineWidth = layer.lineWidth;
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)setCircleColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
{
    _r = r;
    _g = g;
    _b = b;
    _a = a;
}



@end
