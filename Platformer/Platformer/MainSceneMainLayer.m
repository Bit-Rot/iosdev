//
//  MainSceneMainLayer.m
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "MainSceneMainLayer.h"
#import "cocos2d.h"

@implementation MainSceneMainLayer

-(id)init {
	if( (self=[super init])) {
		
		self.touchEnabled = YES;
		self.accelerometerEnabled = YES;
		
		// init physics
		[self initPhysics];
        
        self.hero = [[Hero alloc] initWithSpace:_space parent:self position:CGPointMake(200.0f, 200.0f)];
		
		[self scheduleUpdate];
	}
	
	return self;
}

-(void)initPhysics {
	CGSize s = [[CCDirector sharedDirector] winSize];
	
	_space = cpSpaceNew();
	
	cpSpaceSetGravity( _space, cpv(0, -100) );
	
	//
	// rogue shapes
	// We have to free them manually
	//
	// bottom
	_walls[0] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(s.width,0), 0.0f);
	
	// top
	_walls[1] = cpSegmentShapeNew( _space->staticBody, cpv(0,s.height), cpv(s.width,s.height), 0.0f);
	
	// left
	_walls[2] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(0,s.height), 0.0f);
	
	// right
	_walls[3] = cpSegmentShapeNew( _space->staticBody, cpv(s.width,0), cpv(s.width,s.height), 0.0f);
	
	for (int i=0;i<4;i++) {
		cpShapeSetElasticity( _walls[i], 1.0f );
		cpShapeSetFriction( _walls[i], 1.0f );
		cpSpaceAddStaticShape(_space, _walls[i] );
	}
	
	_debugLayer = [CCPhysicsDebugNode debugNodeForCPSpace:_space];
	_debugLayer.visible = NO;
	[self addChild:_debugLayer z:100];
}

-(void)dealloc {
	// manually Free rogue shapes
	for( int i=0;i<4;i++) {
		cpShapeFree( _walls[i] );
	}
	
	cpSpaceFree( _space );
	
	[super dealloc];
}

-(void)update:(ccTime) delta {
	// Should use a fixed size step based on the animation interval.
	int steps = 2;
	CGFloat dt = [[CCDirector sharedDirector] animationInterval]/(CGFloat)steps;
	
    [self.hero update:dt];
    
	for(int i=0; i<steps; i++){
		cpSpaceStep(_space, dt);
	}
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    bool hasActiveTouches = NO;
	for( UITouch *touch in event.allTouches ) {
        if (![touches containsObject:touch]) {
            hasActiveTouches = YES;
            
            CGPoint location = [touch locationInView: [touch view]];
            location = [[CCDirector sharedDirector] convertToGL: location];
            [self onTouch:location];
            break;
        }
    }
    
    if (!hasActiveTouches) {
        self.hero.movementState = kHeroMovementStateNone;
    }
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        [self onTouch:location];
	}
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        [self onTouch:location];
	}
}

-(void)onTouch:(CGPoint)location {
    if (location.x < [[CCDirector sharedDirector] winSize].width/2) {
        self.hero.movementState = kHeroMovementStateLeft;
    } else {
        self.hero.movementState = kHeroMovementStateRight;
    }
}


@end
