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
@private bool _isInputToMoveLeft;
@private bool _isInputToMoveRight;
@private CGFloat _spriteWidth;
@private CGFloat _spriteHeight;
@private CGFloat _spriteScale;
}


@property (strong, nonatomic) CCSpriteBatchNode* batchNode;
@property (nonatomic) kHeroMovementState movementState;
@property (nonatomic) kHeroMovementState lastMovementState;
@property (nonatomic) kHeroJumpingState jumpingState;
@property (nonatomic) kHeroJumpingState lastJumpingState;
@property (strong, nonatomic) CCAnimation* moveLeftAnimation;
@property (strong, nonatomic) CCAnimation* standLeftAnimation;

+(void)initialize;

-(id)init;
-(id)initWithSpace:(cpSpace*)space parent:(CCNode *)parent;
+(Hero*)hero;
+(Hero*)heroWithSpace:(cpSpace*)space parent:(CCNode*)parent;

-(void)moveLeft;
-(void)moveRight;
-(void)stopMoving;

-(CGFloat)height;
-(CGFloat)width;

-(void)update:(ccTime)delta;

@end
