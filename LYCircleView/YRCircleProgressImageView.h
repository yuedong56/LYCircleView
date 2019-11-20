//
//  YRCircleProgressImageView.h
//  LYCircleView
//
//  Created by yuedongkui on 2019/11/20.
//  Copyright © 2019 LY. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YRCircleProgressImageView : UIImageView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat lineWidth;

- (void)setCircleColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;

@end





@interface CircleProgressLayer : CALayer

@property (nonatomic, assign) CGFloat r;
@property (nonatomic, assign) CGFloat g;
@property (nonatomic, assign) CGFloat b;
@property (nonatomic, assign) CGFloat a;

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat lineWidth;

- (void)setCircleColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;

@end
