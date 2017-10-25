//
//  AnimatorTransition.m
//  TabAnimations
//
//  Created by Prateek on 03/09/17.
//  Copyright © 2017 14K. All rights reserved.
//

#import "AnimatorTransition.h"

@interface AnimatorTransition() <UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) NSTimeInterval duration;
@property (nonatomic,assign) BOOL presenting;

@end

@implementation AnimatorTransition

- (NSTimeInterval)duration{
    return 1.0;
}

- (BOOL)presenting{
    return true;
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = transitionContext.containerView;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect initialFrame = self.originFrame;
    CGRect finalFrame = toView.frame;
    
    CGFloat xFactor = initialFrame.size.width/finalFrame.size.width;
    CGFloat yFactor = initialFrame.size.height/finalFrame.size.height;
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(xFactor, yFactor);
    
    toView.transform = scaleTransform;
    toView.center = CGPointMake(initialFrame.origin.x, initialFrame.origin.y);
    toView.clipsToBounds = YES;
    
    [containerView addSubview:toView];
    [containerView bringSubviewToFront:toView];
    
    [UIView animateWithDuration:self.duration delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        toView.transform = CGAffineTransformIdentity;
        toView.center = CGPointMake(finalFrame.origin.x, finalFrame.origin.y);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    //toView.transform = scale
    
}

@end
