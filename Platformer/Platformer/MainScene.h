//
//  MainScene.h
//  Platformer
//
//  Created by BitRot on 11/2/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MainSceneMainLayer.h"

@interface MainScene : CCScene
@property (strong, nonatomic) CCLayerGradient* gradientLayer;
@property (strong, nonatomic) MainSceneMainLayer* mainLayer;

+(CCScene *) scene;

@end