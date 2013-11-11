//
//  TransparencyPosition.m
//  Platformer
//
//  Created by BitRot on 11/10/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "TransparencyPosition.h"

@implementation TransparencyPosition

-(id)initWithOpacity:(float)opacity target:(CCNode*)target position:(float)position {
    if (self = [self init]) {
        self.opacity = opacity;
        self.target = target;
        self.position = position;
    }
    return self;
}

+(TransparencyPosition*)transparencyPositionWithOpacity:(float)opacity target:(CCNode*)target position:(float)position {
    return [[TransparencyPosition alloc] initWithOpacity:opacity target:target position:(float)position];
}

@end
