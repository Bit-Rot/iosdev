//
//  Hero.m
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "Hero.h"


@implementation Hero

+(void)initialize {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"heather.plist"];
}

//+(CCAnimation*) moveLeftAnimation {
//    static CCAnimation* moveLeftAnimation = nil;
//
//    //Moving left animation
//    if (moveLeftAnimation == nil) {
//        moveLeftAnimation = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:
//                                                                    [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_1.png"],
//                                                                    [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_2.png"],
//                                                                    [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_3.png"],
//                                                                    [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_2.png"], nil]
//                                                             delay:0.15f];
//    }
//
//    return moveLeftAnimation;
//}

//+(CCAnimation*) moveRightAnimation {
//    static CCAnimation* moveRightAnimation = nil;
//
//    //Moving right animation
//    if (moveRightAnimation == nil) {
//        CCSpriteFrame* moveRightFrame1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_right_1.png"];
//        CCSpriteFrame* moveRightFrame2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_right_2.png"];
//        CCSpriteFrame* moveRightFrame3 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_right_3.png"];
//        CCSpriteFrame* moveRightFrame4 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_right_2.png"];
//        moveRightAnimation = [CCAnimation animationWithSpriteFrames: [NSArray arrayWithObjects:moveRightFrame1, moveRightFrame2, moveRightFrame3, moveRightFrame4, nil]
//                                                              delay:0.15f];
//    }
//
//    return moveRightAnimation;
//}

//+(CCAnimation*) standLeftAnimation {
//    static CCAnimation* standLeftAnimation = nil;
//
//    //Standing left animation
//    if (standLeftAnimation == nil) {
//        CCSpriteFrame* standLeftFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_stand_left.png"];
//        standLeftAnimation = [CCAnimation animationWithSpriteFrames: [NSArray arrayWithObjects:standLeftFrame, nil]
//                                                              delay:0.15f];
//    }
//
//    return standLeftAnimation;
//}

//+(CCAnimation*) standRightAnimation {
//    static CCAnimation* standRightAnimation = nil;
//
//    //Standing Right animation
//    if (standRightAnimation == nil) {
//        CCSpriteFrame* standRightFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_stand_right.png"];
//        standRightAnimation = [CCAnimation animationWithSpriteFrames: [NSArray arrayWithObjects:standRightFrame, nil]
//                                                               delay:0.15f];
//    }
//
//    return standRightAnimation;
//}

-(id)init {
    if (self = [super initWithSpriteFrameName:@"heather_stand_right.png"]) {

        _spriteHeight = 18.0f;
        _spriteWidth = 10.0f;
        _spriteScale = 5.0f;
        CGPoint pos = CGPointMake(0.0f, 0.0f);
        
        int num = 4;
        cpVect verts[] = {
            cpv(-1*_spriteWidth*_spriteScale/2,-1*_spriteHeight*_spriteScale/2),
            cpv(-1*_spriteWidth*_spriteScale/2, _spriteHeight*_spriteScale/2),
            cpv(_spriteWidth*_spriteScale/2, _spriteHeight*_spriteScale/2),
            cpv(_spriteWidth*_spriteScale/2,-1*_spriteHeight*_spriteScale/2),
        };
        
        _cpBody = cpBodyNew(1.0f, INFINITY);
        cpBodySetPos(_cpBody, pos );
        
        _cpShape = cpPolyShapeNew(_cpBody, num, verts, CGPointZero);
        cpShapeSetElasticity( _cpShape, 0.0f );
        cpShapeSetFriction( _cpShape, 1.0f );
        
        [self setScale:_spriteScale];
        
        self.movementState = kHeroMovementStateNone;
        self.lastMovementState = kHeroMovementStateNone;
        
        self.moveLeftAnimation = [CCAnimation animationWithSpriteFrames:[NSArray arrayWithObjects:
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_1.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_2.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_3.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_4.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_5.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_6.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_7.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_8.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_9.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_10.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_11.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_12.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_13.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_14.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_15.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_16.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_17.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_18.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_19.png"],
                                                                         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_run_left_20.png"],
                                                                         nil]
                                                                  delay:0.05f];
        
        CCSpriteFrame* standLeftFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heather_stand_left.png"];
        self.standLeftAnimation = [CCAnimation animationWithSpriteFrames: [NSArray arrayWithObjects:standLeftFrame, nil]
                                                                   delay:0.125f];
        
        [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.standLeftAnimation]]];
    }
    
    return self;
}

-(id)initWithSpace:(cpSpace*)space parent:(CCNode *)parent {
    if (self = [self init]) {
        [parent addChild:(CCNode*)self];
        
        cpSpaceAddBody(space, _cpBody);
        cpSpaceAddShape(space, _cpShape);
    }
    
    return self;
}

+(Hero*)hero {
    return [[Hero alloc] init];
}

+(Hero*)heroWithSpace:(cpSpace*)space parent:(CCNode*)parent {
    return [[Hero alloc] initWithSpace:(cpSpace*)space parent:(CCNode *)parent];
}

-(void)moveLeft {
    _isInputToMoveLeft = YES;
    _isInputToMoveRight = NO;
}

-(void)moveRight {
    _isInputToMoveRight = YES;
    _isInputToMoveLeft = NO;
}

-(void)stopMoving {
    _isInputToMoveLeft = NO;
    _isInputToMoveRight = NO;
}

-(CGFloat)height {
    return _spriteHeight*_spriteScale;
}

-(CGFloat)width {
    return _spriteWidth*_spriteScale;
}

-(void)update:(ccTime)delta {
    
    self.lastMovementState = self.movementState;
    if (_isInputToMoveLeft) {
        self.movementState = kHeroMovementStateLeft;
    } else if (_isInputToMoveRight) {
        self.movementState = kHeroMovementStateRight;
    } else {
        self.movementState = kHeroMovementStateNone;
    }
    
    //update state
    cpVect yVelocityVect = cpvadd(_cpBody->v, cpv(-_cpBody->v.x, 0.0f));
    if (self.movementState == kHeroMovementStateLeft) {
        cpBodySetVel(_cpBody, cpvadd(yVelocityVect, cpv(-200.0f, 0.0f)));
    } else if (self.movementState == kHeroMovementStateRight) {
        cpBodySetVel(_cpBody, cpvadd(yVelocityVect, cpv(200.0f, 0.0f)));
    } else if (self.movementState == kHeroMovementStateNone) {
        cpBodySetVel(_cpBody, yVelocityVect);
    }
}

-(void)draw {
    [super draw];
    if (self.movementState == kHeroMovementStateLeft && self.lastMovementState != kHeroMovementStateLeft) {
        [self setFlipX:NO];
        [self stopAllActions];
        [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.moveLeftAnimation]]];
    }
    else if (self.movementState == kHeroMovementStateRight && self.lastMovementState != kHeroMovementStateRight) {
        [self setFlipX:YES];
        [self stopAllActions];
        [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.moveLeftAnimation]]];
    } else if (self.movementState == kHeroMovementStateNone && self.lastMovementState == kHeroMovementStateLeft) {
        [self setFlipX:NO];
        [self stopAllActions];
        [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.standLeftAnimation]]];
    } else if (self.movementState == kHeroMovementStateNone && self.lastMovementState == kHeroMovementStateRight) {
        [self setFlipX:YES];
        [self stopAllActions];
        [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.standLeftAnimation]]];
    }
}

@end
