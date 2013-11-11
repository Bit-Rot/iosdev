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
	if((self=[super init])) {
		
        //Initialize input
		self.touchEnabled = YES;
		self.accelerometerEnabled = YES;
		
		//Initialize Physics
		[self initPhysics];
        
        //Initialize Hero
        self.hero = [Hero heroWithSpace:_space parent:self];
        [self.hero setPosition:CGPointMake(200.0f, self.hero.height/2 + 20.0f)];
        
        //Initialize Ground Texture
        CCTexture2D *groundTexture = [[CCTextureCache sharedTextureCache] addImage:@"ground_pixelated.png"];
        ccTexParams params = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_LINEAR};
        [groundTexture setTexParameters:&params];
        CCSprite *groundSprite = [CCSprite spriteWithTexture:groundTexture rect:CGRectMake(0, 0, 1000000, 16)];
        [groundSprite setScale:4.0f];
        [self addChild:groundSprite];

        //Initialize Camera
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.cameraNode = [CCNode node];
        [self.cameraNode setPosition:(CGPointMake(winSize.width/2, winSize.height/2))];
        [self addChild:self.cameraNode];
		
		[self scheduleUpdate];
	}
	
	return self;
}

-(void)initPhysics {
	CGSize s = [[CCDirector sharedDirector] winSize];
	int numScreens = 13;
    
	_space = cpSpaceNew();
	
	cpSpaceSetGravity( _space, cpv(0, -100) );
	
	//
	// rogue shapes
	// We have to free them manually
	//
	// bottom
	_walls[0] = cpSegmentShapeNew( _space->staticBody, cpv(0,20.0f), cpv(s.width*numScreens,20.0f), 0.0f);
	
	// top
	_walls[1] = cpSegmentShapeNew( _space->staticBody, cpv(0,s.height), cpv(s.width*numScreens,s.height), 0.0f);
	
	// left
	_walls[2] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(0,s.height), 0.0f);
	
	// right
	_walls[3] = cpSegmentShapeNew( _space->staticBody, cpv(s.width*numScreens,0), cpv(s.width*numScreens,s.height), 0.0f);
	
	for (int i=0;i<4;i++) {
		cpShapeSetElasticity( _walls[i], 0.0f );
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
	for(UITouch *touch in event.allTouches) {
        if (![touches containsObject:touch]) {
            hasActiveTouches = YES;
            
            CGPoint location = [touch locationInView: [touch view]];
            location = [[CCDirector sharedDirector] convertToGL: location];
            [self onTouch:location];
            break;
        }
    }
    
    if (!hasActiveTouches) {
        [self.hero stopMoving];
    }
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        [self onTouch:location];
	}
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        [self onTouch:location];
	}
}

-(void)onTouch:(CGPoint)location {
    if (location.x < [[CCDirector sharedDirector] winSize].width/2) {
        [self.hero moveLeft];
    } else {
        [self.hero moveRight];
    }
}

-(void)draw {
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    float cameraFollowDistance = winSize.width*0.3f;
    float cameraMinX = winSize.width/2.0f;
    float cameraMaxX = winSize.width*13.0f;
    
    float x = self.cameraNode.position.x;
    float y = self.cameraNode.position.y;
    if (x > self.hero.position.x + cameraFollowDistance) {
        x = self.hero.position.x + cameraFollowDistance;
    } else if (x < self.hero.position.x - cameraFollowDistance) {
        x = self.hero.position.x - cameraFollowDistance;
    }
    if (x < cameraMinX) {
        x = cameraMinX;
    } else if (x > cameraMaxX) {
        x = cameraMaxX;
    }
//    if (y <= self.hero.position.y + 3 || y >= self.hero.position.y - 3) {
//        y = self.hero.position.y;
//    } else if (y > self.hero.position.y + 30 || y < self.hero.position.y - 30) {
//        y = (y + self.hero.position.y)/2;
//    }
    [[self cameraNode] setPosition:(CGPointMake(x,y))];
    [self runAction: [CCFollow actionWithTarget:self.cameraNode]];
    
    [super draw];
}


/*
-(void)draw {
    
    float eyeX, eyeY, eyeZ;
//    [[self camera] eyeX:&eyeX eyeY:&eyeY eyeZ:&eyeZ];
    [[self camera] centerX:&eyeX centerY:&eyeY centerZ:&eyeZ];
    CCCamera* camera = [self camera];

    if (eyeX > self.hero.position.x + 200) {
        eyeX = self.hero.position.x + 200;
    } else if (eyeX < self.hero.position.x - 200) {
        eyeX = self.hero.position.x - 200;
    }
    
    if (eyeY <= self.hero.position.y + 3 || eyeY >= self.hero.position.y - 3) {
        eyeY = self.hero.position.y;
    } else if (eyeY > self.hero.position.y + 30 || eyeY < self.hero.position.y - 30) {
        eyeY = (eyeY + self.hero.position.y)/2;
    }
//    [[self camera] setEyeX:eyeX eyeY:eyeY eyeZ:eyeZ];
    [[self camera] setCenterX:eyeX centerY:eyeY centerZ:eyeZ];
    
    [super draw];
}
*/

@end
