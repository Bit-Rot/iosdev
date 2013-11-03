//
//  Hero.h
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "cocos2d.h"

typedef enum {
	kHeroMovementStateLeft = 0,
	kHeroMovementStateRight = 1,
	kHeroMovementStateNone = 2,
} kHeroMovementState;

typedef enum {
	kHeroJumpingStateJumping = 0,
	kHeroJumpingStateNone = 1,
} kHeroJumpingState;

@interface Hero : CCPhysicsSprite
{
@private cpShape* _cpShape;
}

@property (strong, nonatomic) CCSpriteBatchNode* batchNode;
@property kHeroMovementState movementState;
@property kHeroMovementState lastMovementState;
@property kHeroJumpingState jumpingState;
@property kHeroJumpingState lastJumpingState;

-(id)init;
-(id)initWithSpace:(cpSpace*)space parent:(CCNode *)parent position:(CGPoint)position;
-(Hero *)hero;
-(Hero *)heroWithSpace:(cpSpace*)space parent:(CCNode *)parent position:(CGPoint)position;

-(void)update:(ccTime)delta;

@end
