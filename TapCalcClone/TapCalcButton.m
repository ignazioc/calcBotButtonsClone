//
//  TapCalcButton.m
//  TapCalcClone
//
//  Created by Ignazio Calò on 9/17/12.
//  Copyright (c) 2012 Ignazio Calò. All rights reserved.
//

#import "TapCalcButton.h"

@implementation TapCalcButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UILabel *l = [[UILabel alloc]initWithFrame:self.bounds];
        [l setTextAlignment:UITextAlignmentCenter];
        [l setText:@"5"];
        [l setTextColor:[UIColor whiteColor]];
        [l setFont:[UIFont boldSystemFontOfSize:20]];
        [l setShadowColor:[UIColor blackColor]];
        [l setShadowOffset:CGSizeMake(0, -1)];
        [l setBackgroundColor:[UIColor clearColor]];
        [self addSubview:l];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
    - (void)drawRect:(CGRect)arect
    {
        
        CGContextRef contex = UIGraphicsGetCurrentContext();
        
        
        float shadowColorValue = 70.0  / 255;
        CGColorRef shadowColor = [UIColor colorWithRed:shadowColorValue green:shadowColorValue blue:shadowColorValue alpha:1].CGColor;
        UIBezierPath *fullPath = [UIBezierPath bezierPathWithRoundedRect:rectFor1PxStroke(arect) cornerRadius:5];
        CGContextAddPath(contex, fullPath.CGPath);
        CGContextSetFillColorWithColor(contex, shadowColor);
        [fullPath fill];
        
        
        
        CGRect rect = rectFor1PxStroke(CGRectInset(arect, 1, 1));
        
        //Black background
        CGColorRef blackColor = [UIColor blackColor].CGColor;
        CGContextSetFillColorWithColor(contex, blackColor);
        

        UIBezierPath *rectPat = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5];
        CGContextAddPath(contex, rectPat.CGPath);
        [rectPat fill];
        

        
        
        //Gray button
        CGRect button = CGRectInset(rect, 1.5, 1.5 );
        UIBezierPath *buttonPath = [UIBezierPath bezierPathWithRoundedRect:button cornerRadius:5];
        CGContextAddPath(contex, buttonPath.CGPath);
        CGContextClip(contex);
        
        float lightGrayValue = 161.0 / 255;
        float darkGrayValye = 88.0 / 255;
        CGColorRef lightGray = [UIColor colorWithRed:lightGrayValue green:lightGrayValue blue:lightGrayValue alpha:1.0].CGColor;
        CGColorRef darkGray = [UIColor colorWithRed:darkGrayValye green:darkGrayValye blue:darkGrayValye alpha:1.0].CGColor;
        drawLinearGradient(contex, button, lightGray, darkGray);
        
        //rect inside button
        float bordercolorValue = 105.0 / 255;
        float lightcolorValue = 113.0 / 255;
        float darkcolorValue = 70.0 / 255;
        CGColorRef borderColor = [UIColor colorWithRed:bordercolorValue green:bordercolorValue blue:bordercolorValue alpha:1.0].CGColor;
        CGColorRef lightcolor = [UIColor colorWithRed:lightcolorValue green:lightcolorValue blue:lightcolorValue alpha:1.0].CGColor;
        CGColorRef darkcolor = [UIColor colorWithRed:darkcolorValue green:darkcolorValue blue:darkcolorValue alpha:1.0].CGColor;
        CGRect rectinside = CGRectInset(rect, 5, 5);
        CGContextSetFillColorWithColor(contex, [UIColor redColor].CGColor);
        CGContextSetStrokeColorWithColor(contex, borderColor);
        CGContextSetLineWidth(contex, 1);
        
        CGContextStrokeRect(contex, rectFor1PxStroke(rectinside));
        drawLinearGradient(contex, rectinside, lightcolor, darkcolor);
        
        
           
    }


    CGRect rectFor1PxStroke(CGRect rect) {
        return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5,
                          rect.size.width - 1, rect.size.height - 1);
    }


    void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor)
    {
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGFloat locations[] = {0.0, 1.0};
        
        NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
        CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, locations);
        
        CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
        CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
        
        CGContextSaveGState(context);
        CGContextAddRect(context, rect);
        CGContextClip(context);
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        CGContextRestoreGState(context);
        
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorspace);
        
    }

CGSize offset;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint point = [t locationInView:self.superview];
    
    offset = CGSizeMake(point.x - self.center.x, point.y - self.center.y);
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint newposition = [t locationInView:self.superview];
    CGPoint right = CGPointMake(newposition.x - offset.width, newposition.y - offset.height);
    self.center = right;
}

@end
