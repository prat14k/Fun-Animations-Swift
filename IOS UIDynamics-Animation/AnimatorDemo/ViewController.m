//
//  ViewController.m
//  AnimatorDemo
//
//  Created by Prateek Sharma on 7/4/17.
//  Copyright © 2017 Bingo Tech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewInner;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@end

@implementation ViewController

- (UIDynamicAnimator *)animator{
    
    if(!_animator){
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.viewInner];
    }
    
    return _animator;
}

- (UIGravityBehavior *)gravity{
    if(!_gravity){
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude=0.9;
        
        [self.animator addBehavior:_gravity];
    }
    return _gravity;
}

- (UICollisionBehavior *)collider{
    if(!_collider){
        _collider = [[UICollisionBehavior alloc] init];
        
        /* THis will make the collider use the bounds of the reference view as the bound for collision */
        
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        
        [self.animator addBehavior:_collider];
        
    }
    return _collider;
}


static const CGSize DROP_PT = {40,40};

- (IBAction)tapAction1:(UITapGestureRecognizer *)sender {
    [self drop];
}

- (void)drop{

    /* This will basically make a block frame of size 40x40
        on the upper side of the mobile .
     Thats why , the frame is given an origin of 0.
     The width is then managed by gettinig a ranadom number,
     bringing it inside the window width value, then finding the point to show that frame by dividing it with the frame width and getting an absolute floor value.
     
     Then just getting a random color and adding the view aas a subview in our main view.
     
     */
    
    
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_PT;
    int x = (arc4random()%(int)self.viewInner.bounds.size.width) / DROP_PT.width;
    
    frame.origin.x = x * DROP_PT.width;
    
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.viewInner addSubview:dropView];
    
    
    //This will add the view in the gravity animation part
    
    [self.gravity addItem:dropView];
    [self.collider addItem:dropView];
    
    
}

- (UIColor *)randomColor{
    
    //UIColor *color;
    
    switch((arc4random()%5)){
        case 0: return [UIColor blueColor];
        case 1: return [UIColor magentaColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor cyanColor];
        case 4: return [UIColor greenColor];
        default: return [UIColor brownColor];
    }
    
    return [UIColor blackColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
