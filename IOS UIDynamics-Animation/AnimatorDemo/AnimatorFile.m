//
//  AnimatorFile.m
//  AnimatorDemo
//
//  Created by Prateek Sharma on 7/4/17.
//  Copyright © 2017 Bingo Tech. All rights reserved.
//

#import "AnimatorFile.h"

@interface AnimatorFile()

@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@property (strong, nonatomic) UIDynamicItemBehavior *itemBehavior;

@end


@implementation AnimatorFile


- (instancetype)init{
    
    self = [super init];
    
    //NSLog(@"sdasd");
    [self addChildBehavior:self.gravity];
    //NSLog(@"dd");
    [self addChildBehavior:self.collider];
    [self addChildBehavior:self.itemBehavior];
    return self;
}

- (UIDynamicItemBehavior *)itemBehavior{
    
    if(!_itemBehavior){
        
        _itemBehavior = [[UIDynamicItemBehavior alloc] init];
        _itemBehavior.allowsRotation = NO;
        
    }
    
    return _itemBehavior;
}

- (UIGravityBehavior *)gravity{
    
    if(!_gravity){
        _gravity = [[UIGravityBehavior alloc] init];
        
        _gravity.magnitude = 0.9; // Around the global gravitational 'g' value
    }
    
    return _gravity;
}

- (UICollisionBehavior *)collider{
    
    if(!_collider){
        
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        
    }
    
    return _collider;
}


- (void)removeItem:(id<UIDynamicItem>)item{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.itemBehavior removeItem:item];
}

- (void)addItem:(id<UIDynamicItem>)item{
    [self.collider addItem:item];
    [self.gravity addItem:item];
    [self.itemBehavior addItem:item];
}


@end
