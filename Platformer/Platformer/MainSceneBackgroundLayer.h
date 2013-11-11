//
//  MainSceneBackgroundLayer.h
//  Platformer
//
//  Created by BitRot on 11/7/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "CCLayer.h"
#import "Hero.h"
#import "cocos2d.h"

@interface MainSceneBackgroundLayer : CCLayerGradient
{
@private Hero* _hero;
}
@property (strong, nonatomic) CCSprite* sun;
@property (strong, nonatomic) CCSprite* moon;
@property (strong, nonatomic) NSMutableArray* colorPositionArray;
@property (strong, nonatomic) NSMutableArray* transparencyPositionArray;

-(id)initWithHero:(Hero*)hero;
+(MainSceneBackgroundLayer*)layerWithHero:(Hero*)hero;

-(void)draw;
-(void)drawSunWithPosition:(CGFloat)position screenWidth:(CGFloat)screenWidth;
-(void)drawMoonWithPosition:(CGFloat)position screenWidth:(CGFloat)screenWidth;
-(void)drawSkyWithPosition:(CGFloat)position screenWidth:(CGFloat)screenWidth;

@end
