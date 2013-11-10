//
//  MainSceneBackgroundLayer.m
//  Platformer
//
//  Created by BitRot on 11/7/13.
//  Copyright (c) 2013 BitRot. All rights reserved.
//

#import "MainSceneBackgroundLayer.h"
#import "ColorPosition.h"

@implementation MainSceneBackgroundLayer

-(id)init {
    if (self = [super init]) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        //TODO: Initialize sun, moon, and colorpositions
        self.colorPositionArray = [NSMutableArray array];
        [self.colorPositionArray addObject:[ColorPosition colorPositionWithStartColor:ccc3(0,0,0) endColor:ccc3(50,50,50) position:0.0f]];
        [self.colorPositionArray addObject:[ColorPosition colorPositionWithStartColor:ccc3(255,255,255) endColor:ccc3(50,50,50) position:winSize.width]];
        [self.colorPositionArray addObject:[ColorPosition colorPositionWithStartColor:ccc3(5,5,5) endColor:ccc3(255,50,255) position:winSize.width*2]];
        [self.colorPositionArray addObject:[ColorPosition colorPositionWithStartColor:ccc3(255,5,5) endColor:ccc3(150,150,150) position:winSize.width*3]];
    }
    return self;
}

-(id) initWithHero:(Hero*)hero {
    if (self = [self init]) {
        _hero = hero;
    }
    return self;
}

+(MainSceneBackgroundLayer*)layerWithHero:(Hero*)hero {
    return [[MainSceneBackgroundLayer alloc] initWithHero:hero];
}

/**
 * Animate sun, moon, sky depending on player position;
 * Sun and moon should follow negative parabolic motion through brief phases of the cycle {y = -0.1X^2 + peakHeight}
 */
-(void) draw {
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    [self drawSunWithPosition:_hero.position.x screenWidth:winSize.width];
    [self drawMoonWithPosition:_hero.position.x screenWidth:winSize.width];
    [self drawSkyWithPosition:_hero.position.x screenWidth:winSize.width];
    
    [super draw];
}

-(void)drawSunWithPosition:(CGFloat)position screenWidth:(CGFloat)screenWidth {
    
}

-(void)drawMoonWithPosition:(CGFloat)position screenWidth:(CGFloat)screenWidth {
    
}

-(void)drawSkyWithPosition:(CGFloat)position screenWidth:(CGFloat)screenWidth {
    if (self.colorPositionArray.count >= 2) {
        for (int i=0; i<self.colorPositionArray.count-1; i++) {
            ColorPosition* position1 = [self.colorPositionArray objectAtIndex:i];
            ColorPosition* position2 = [self.colorPositionArray objectAtIndex:i+1];
            if (position1.position <= position && position < position2.position) {
                
                //Use a whole bunch of CGFloat's for readability and hope it gets optimized out by the compiler
                CGFloat width = position2.position - position1.position;
                CGFloat distanceFromPosition1 = position - position1.position;
                CGFloat percentDistance = (width - distanceFromPosition1)/width;
                CGFloat startRed = percentDistance*position1.startColor.r + (1-percentDistance)*position2.startColor.r;
                CGFloat startGreen = percentDistance*position1.startColor.g + (1-percentDistance)*position2.startColor.g;
                CGFloat startBlue = percentDistance*position1.startColor.b + (1-percentDistance)*position2.startColor.b;
                self.startColor = ccc3(startRed, startGreen, startBlue);
                
                CGFloat endRed = percentDistance*position1.endColor.r + (1-percentDistance)*position2.endColor.r;
                CGFloat endGreen = percentDistance*position1.endColor.g + (1-percentDistance)*position2.endColor.g;
                CGFloat endBlue = percentDistance*position1.endColor.b + (1-percentDistance)*position2.endColor.b;
                self.endColor = ccc3(endRed, endGreen, endBlue);
            }
        }
    } else {
        self.startColor=ccc3(0,0,0);
        self.endColor=ccc3(0,0,0);
    }
}

@end
