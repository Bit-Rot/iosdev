//
//  ColorPoint.h
//  Platformer
//
//  Created by BitRot on 11/8/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ColorPosition : NSObject
@property (nonatomic) float position;
@property (nonatomic) ccColor3B startColor;
@property (nonatomic) ccColor3B endColor;

-(id)initWithStartColor:(ccColor3B)startColor endColor:(ccColor3B)endColor position:(float)position;
+(ColorPosition*)colorPositionWithStartColor:(ccColor3B)startColor endColor:(ccColor3B)endColor position:(float)position;
@end
