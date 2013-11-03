//
//  MainScene.m
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "MainScene.h"
#import "MainSceneMainLayer.h"

@implementation MainScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainSceneMainLayer *layer = [MainSceneMainLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


@end