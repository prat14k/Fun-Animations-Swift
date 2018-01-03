//
//  secViewController.m
//  AnimatorDemo
//
//  Created by Prateek Sharma on 7/4/17.
//  Copyright © 2017 Bingo Tech. All rights reserved.
//

#import "secViewController.h"
#import "AnimatorFile.h"

@interface secViewController ()
@property (strong, nonatomic) AnimatorFile *animatorBehaviour;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;
@property (strong, nonatomic) UIView *droppedItem;
@property (weak, nonatomic) IBOutlet UIView *viewMain;
@end

@implementation secViewController

static const CGSize BOX = {40,40};

- (IBAction)tapAction:(id)sender {
    
    [self animateIt];
    
}
- (IBAction)panAction:(UIPanGestureRecognizer *)sender {
    
    // This will give us the location
    CGPoint gesturePoint = 	[sender locationInView:self.viewMain];
    
    if(sender.state == UIGestureRecognizerStateBegan){
        [self attachBoxToPoint:gesturePoint];
    }
    else if(sender.state == UIGestureRecognizerStateChanged){
        self.attachment.anchorPoint = gesturePoint;
    }
    else if(sender.state == UIGestureRecognizerStateEnded){
        [self.animator removeBehavior:self.attachment];
    }
    
    
}

- (void)attachBoxToPoint:(CGPoint)point{
    
    if(self.droppedItem){
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.droppedItem attachedToAnchor:point];
        
        self.droppedItem = nil;
        
        [self.animator addBehavior:self.attachment];
    }
    
    
}

- (void)animateIt{
    
    //NSLog(@"sdsd");
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = BOX;
    
    int x = (arc4random()%(int)self.viewMain.bounds.size.width) / BOX.width;
    
    frame.origin.x = x * BOX.width;
    
    UIView *subV = [[UIView alloc] initWithFrame:frame];
    
    subV.backgroundColor = [self randomColor];
    
    self.droppedItem = subV;
    
    [self.viewMain addSubview:subV];
    
    [self.animatorBehaviour addItem:subV];
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

- (AnimatorFile *)animatorBehaviour{
    
    if(!_animatorBehaviour){
        _animatorBehaviour = [[AnimatorFile alloc] init];
        
        [self.animator addBehavior:_animatorBehaviour];
        
    }
    
    return _animatorBehaviour;
}

- (UIDynamicAnimator *)animator{
    if(!_animator){
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.viewMain];
        
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //self.viewMain.bounds.size.width = self.view.bounds.size.width;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
