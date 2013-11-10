//
//  MainSceneMainLayer.h
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "CCLayer.h"
#import "chipmunk.h"
#import "cocos2d.h"
#import "Hero.h"

@interface MainSceneMainLayer : CCLayer
{
	CCPhysicsDebugNode *_debugLayer; // weak ref
	
	cpSpace *_space; // strong ref
	
	cpShape *_walls[4];
}

@property (strong, nonatomic) Hero* hero;
@property (strong, nonatomic) CCNode* cameraNode;
-(void) initPhysics;
@end
