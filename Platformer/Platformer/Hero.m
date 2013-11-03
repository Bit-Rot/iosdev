//
//  Hero.m
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "Hero.h"

@implementation Hero

-(id)init {
    if (self = [super initWithFile:@"grossini_dance_atlas.png" rect:CGRectMake(0, 0, 85, 121)]) {
        
        CGPoint pos = CGPointMake(200.0f, 200.0f);
        
        int num = 4;
        cpVect verts[] = {
            cpv(-24,-54),
            cpv(-24, 54),
            cpv( 24, 54),
            cpv( 24,-54),
        };
        
        _cpBody = cpBodyNew(1.0f, INFINITY);
        cpBodySetPos(_cpBody, pos );
        
        _cpShape = cpPolyShapeNew(_cpBody, num, verts, CGPointZero);
        cpShapeSetElasticity( _cpShape, 0.5f );
        cpShapeSetFriction( _cpShape, 0.5f );
        
        self.movementState = kHeroMovementStateNone;
    }
    
    return self;
}

-(id)initWithSpace:(cpSpace*)space parent:(CCNode *)parent position:(CGPoint)position {
    if (self = [self init]) {
        [parent addChild:(CCNode*)self];

        cpSpaceAddBody(space, _cpBody);
        cpSpaceAddShape(space, _cpShape);
        self.position = position;
    }
    
    return self;
}

-(Hero*)hero {
    return [[Hero alloc] init];
}

-(Hero*)heroWithSpace:(cpSpace*)space parent:(CCNode*)parent position:(CGPoint)position {
    return [[Hero alloc] initWithSpace:(cpSpace*)space parent:(CCNode *)parent position:(CGPoint)position];
}

-(void)update:(ccTime)delta {
    //update state
    self.lastMovementState = self.movementState;
    cpVect yVelocityVect = cpvadd(_cpBody->v, cpv(-_cpBody->v.x, 0.0f));
    if (self.movementState == kHeroMovementStateLeft) {
        cpBodySetVel(_cpBody, cpvadd(yVelocityVect, cpv(-300.0f, 0.0f)));
    } else if (self.movementState == kHeroMovementStateRight) {
        cpBodySetVel(_cpBody, cpvadd(yVelocityVect, cpv(300.0f, 0.0f)));
    } else if (self.movementState == kHeroMovementStateNone) {
        cpBodySetVel(_cpBody, yVelocityVect);
    }
}

-(void)draw {
    [super draw];
}

@end
