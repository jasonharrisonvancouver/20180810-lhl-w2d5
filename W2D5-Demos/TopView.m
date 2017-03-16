//
//  TopView.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "TopView.h"

/*
 CoreGraphics
 */

@implementation TopView


- (void)drawRect:(CGRect)rect {
  // get context first
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 5.0);
  CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
  CGContextMoveToPoint(context, 20, 30);
  CGContextAddLineToPoint(context, 200, 30);
  CGContextStrokePath(context);
  CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
  CGContextFillRect(context, CGRectMake(100, 100, 100, 50));
  CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
  CGContextFillEllipseInRect(context, CGRectMake(200, 200, 100, 50));
}


@end
