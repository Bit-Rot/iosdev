//
//  MainScene.m
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "MainScene.h"
#import "MainSceneMainLayer.h"
#import "MainSceneBackgroundLayer.h"

@implementation MainScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	MainScene *scene = [MainScene node];
	
	// 'layer' is an autorelease object.
	MainSceneMainLayer *layer = [MainSceneMainLayer node];
    
    scene.gradientLayer = [MainSceneBackgroundLayer layerWithHero:layer.hero];
	
	// add layer as a child to scene
    [scene addChild:scene.gradientLayer z:0];
	[scene addChild:layer z:1];
	
	// return the scene
	return scene;
}


@end