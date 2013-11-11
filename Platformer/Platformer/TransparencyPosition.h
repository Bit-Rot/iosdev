//
//  TransparencyPosition.h
//  Platformer
//
//  Created by BitRot on 11/10/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TransparencyPosition : NSObject
@property (nonatomic) float position;
@property (nonatomic) float opacity;
@property (retain, nonatomic) CCNode* target;

-(id)initWithOpacity:(float)opacity target:(CCNode*)target position:(float)position;
+(TransparencyPosition*)transparencyPositionWithOpacity:(float)opacity target:(CCNode*)target position:(float)position;
@end
