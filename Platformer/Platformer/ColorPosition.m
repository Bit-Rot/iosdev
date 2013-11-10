//
//  ColorPoint.m
//  Platformer
//
//  Created by BitRot on 11/8/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "ColorPosition.h"

@implementation ColorPosition

-(id)initWithStartColor:(ccColor3B)startColor endColor:(ccColor3B)endColor position:(float)position {
    if (self = [self init]) {
        self.startColor = startColor;
        self.endColor = endColor;
        self.position = position;
    }
    return self;
}

+(ColorPosition*)colorPositionWithStartColor:(ccColor3B)startColor endColor:(ccColor3B)endColor position:(float)position {
    return [[ColorPosition alloc] initWithStartColor:startColor endColor:endColor position:position];
}

@end
