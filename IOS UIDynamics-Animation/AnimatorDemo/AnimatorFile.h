//
//  AnimatorFile.h
//  AnimatorDemo
//
//  Created by Prateek Sharma on 7/4/17.
//  Copyright © 2017 Bingo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatorFile : UIDynamicBehavior 

- (void)addItem:(id <UIDynamicItem>)item; // Protocol Syntax

- (void)removeItem:(id <UIDynamicItem>)item;


@end
