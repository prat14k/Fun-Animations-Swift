//
//  ViewController.m
//  TabAnimations
//
//  Created by Prateek on 03/09/17.
//  Copyright © 2017 14K. All rights reserved.
//

#import "ViewController.h"
#import "AnimatorTransition.h"

@interface ViewController () <UITabBarControllerDelegate>

@property (strong,nonatomic) AnimatorTransition *animateV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarController.delegate = self;
}


/*
//Fade and bring the new view
 
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    UIViewController *sel = tabBarController.selectedViewController;
    
    if(sel == nil || viewController == sel){
        return NO;
    }
    
    UIView *fromView = sel.view;
    UIView *toView = viewController.view;
    
    [UIView transitionFromView:fromView toView:toView duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        
    }];
    
    return YES;
}
*/


/*
 
// Page Up and Down Curling
 
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    
    if(tabBarController.selectedViewController == nil || tabBarController.selectedViewController == viewController)
        return NO;
    
    int controllerIndex = [tabBarController.viewControllers indexOfObject:viewController];
    
    UIView * fromView = tabBarController.selectedViewController.view;
    UIView * toView = viewController.view;
    
    // Transition using a page curl.
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:0.5
                       options:(controllerIndex > tabBarController.selectedIndex ? UIViewAnimationOptionTransitionCurlUp : UIViewAnimationOptionTransitionCurlDown)
                    completion:^(BOOL finished) {
                        if (finished) {
                            
                        }
                    }];
    
    
    return YES;
}
 */

/*
// Left and right swipe
 
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    
    
    NSUInteger controllerIndex = [tabBarController.viewControllers indexOfObject:viewController];
    
    if (controllerIndex == tabBarController.selectedIndex) {
        return NO;
    }
    
    // Get the views.
    UIView *fromView = tabBarController.selectedViewController.view;
    UIView *toView = [tabBarController.viewControllers[controllerIndex] view];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    BOOL scrollRight = controllerIndex > tabBarController.selectedIndex;
    
    // Add the to view to the tab bar view.
    [fromView.superview addSubview:toView];
    
    // Position it off screen.
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    toView.frame = CGRectMake((scrollRight ? screenWidth : -screenWidth), viewSize.origin.y, screenWidth, viewSize.size.height);
    
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         // Animate the views on and off the screen. This will appear to slide.
                         fromView.frame = CGRectMake((scrollRight ? -screenWidth : screenWidth), viewSize.origin.y, screenWidth, viewSize.size.height);
                         toView.frame = CGRectMake(0, viewSize.origin.y, screenWidth, viewSize.size.height);
                     }
     
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             // Remove the old view from the tabbar view.
                             [fromView removeFromSuperview];
                             tabBarController.selectedIndex = controllerIndex;
                         }
                     }];
    
    return NO;
    
}

 */

/*

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    
    if(tabBarController.selectedViewController == nil || tabBarController.selectedViewController == viewController)
        return NO;
    
    int controllerIndex = [tabBarController.viewControllers indexOfObject:viewController];
    
    UIView * fromView = tabBarController.selectedViewController.view;
    UIView * toView = viewController.view;
    
    // Transition using a page curl.
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:0.5
                       options:(controllerIndex > tabBarController.selectedIndex ?  UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight)
                    completion:^(BOOL finished) {
                        if (finished) {
                            
                        }
                    }];
    
    
    return YES;
}

*/

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    
    self.animateV = [[AnimatorTransition alloc] init];
    self.animateV.originFrame = self.tabBarController.tabBar.frame;
    
    return self.animateV;
    
}


@end
