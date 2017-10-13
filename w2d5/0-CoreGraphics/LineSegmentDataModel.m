//
//  LineSegment.m
//  W2D5-Demos
//
//  Created by Roland Tecson on 2017-10-10.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "LineSegmentDataModel.h"

@implementation LineSegmentDataModel

- (instancetype)initWithFirstPoint:(CGPoint)first
                       secondPoint:(CGPoint)second
{
  if (self = [super init]) {
    _firstPoint = first;
    _secondPoint = second;
  }
  return self;
}

@end
