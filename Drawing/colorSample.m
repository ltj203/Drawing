//
//  colorSample.m
//  Drawing
//
//  Created by Lisa Jenkins on 3/1/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import "colorSample.h"

@implementation colorSample
@synthesize red, green, blue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGFloat radius = 0.3*bounds.size.width;
    CGRect r = CGRectMake(bounds.origin.x, bounds.origin.y, 2*radius, 2*radius);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, red, green, blue, 1);
    CGContextFillPath(c);
}


@end
