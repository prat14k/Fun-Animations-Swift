//
//  TableViewController.m
//  Dummy TableView
//
//  Created by IIMJobs User on 02/08/17.
//  Copyright © 2017 IIMJobs User. All rights reserved.
//

#import "TableViewController.h"
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"

@interface TableViewController (){
    UIImageOrientation scrollOrientation;
    CGPoint lastPos;
}


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 34;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    MGSwipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    /*
    UIButton *b1 = [[UIButton alloc] init];
    b1.titleLabel.text = @"ABC";
    b1.backgroundColor = [UIColor greenColor];
    [b1 sizeToFit];
    
    //configure left buttons
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"ABC" backgroundColor:[UIColor greenColor]]];
   
    //cell.leftButtons = @[b1];
    cell.leftSwipeSettings.transition = MGSwipeTransitionDrag;
    cell.leftExpansion.buttonIndex = 0;
    cell.leftExpansion.fillOnTrigger = YES;
    cell.leftExpansion.threshold = 1.3;
   
    //UIButton *b2 = [[UIButton alloc] init];
    //b1.titleLabel.text = @"CDE";
    //b1.backgroundColor = [UIColor orangeColor];
    
    //configure right buttons
    //cell.rightButtons = @[b2];
    //cell.rightSwipeSettings.transition = MGSwipeTransitionDrag;
    
    
    // Configure the cell... */
    
    return cell;
}




- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   /*
    UIView *cellContentView  = [cell contentView];
    CGFloat rotationAngleDegrees = -30;
    CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
    CGPoint offsetPositioning = CGPointMake(500, -20.0);
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, rotationAngleRadians, -50.0, 0.0, 1.0);
    transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50.0);
    cellContentView.layer.transform = transform;
    cellContentView.layer.opacity = 0.8;
    
    [UIView animateWithDuration:.65 delay:0.0 usingSpringWithDamping:0.85 initialSpringVelocity:.8 options:0 animations:^{
        cellContentView.layer.transform = CATransform3DIdentity;
        cellContentView.layer.opacity = 1;
    } completion:^(BOOL finished) {}];
    */
    
    /*
    UIView *cellContentView = [cell contentView];
    CGFloat rotationAngleDegrees = -30;
    CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
    CGPoint offsetPositioning = CGPointMake(0, cell.contentView.frame.size.height*4);
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, rotationAngleRadians, -50.0, 0.0, 1.0);
    transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50.0);
    cellContentView.layer.transform = transform;
    cellContentView.layer.opacity = 0.8;
    
    [UIView animateWithDuration:0.65 delay:00 usingSpringWithDamping:0.85 initialSpringVelocity:0.8 options:0 animations:^{
        cellContentView.layer.transform = CATransform3DIdentity;
        cellContentView.layer.opacity = 1;
    } completion:^(BOOL finished) {}];

     */
    
    /*
    if (tableView.isDragging) {
        UIView *myView = cell.contentView;
        CALayer *layer = myView.layer;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -1000;
        if (scrollOrientation == UIImageOrientationDown) {
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI*0.5, 1.0f, 0.0f, 0.0f);
        } else {
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -M_PI*0.5, 1.0f, 0.0f, 0.0f);
        }
        layer.transform = rotationAndPerspectiveTransform;
        [UIView animateWithDuration:.5 animations:^{
            layer.transform = CATransform3DIdentity;
        }];
    }
    */
    
    cell.alpha = 0.0;
    CATransform3D trans = CATransform3DTranslate(CATransform3DIdentity, 0, 20, 1000);
    cell.layer.transform = trans;
    [UIView animateWithDuration:1.0 animations:^{
        cell.alpha = 1.0;
        cell.layer.transform = CATransform3DIdentity;
    }];
    
}



#pragma mark Swipe Delegate

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell canSwipe:(MGSwipeDirection) direction;
{
    return YES;
}

 //To monitor the swiping state
-(void) swipeTableCell:(MGSwipeTableCell*) cell didChangeSwipeState:(MGSwipeState)state gestureIsActive:(BOOL)gestureIsActive
{
    NSString * str;
    switch (state) {
        case MGSwipeStateNone: str = @"None"; break;
        case MGSwipeStateSwippingLeftToRight: str = @"SwippingLeftToRight"; break;
        case MGSwipeStateSwippingRightToLeft: str = @"SwippingRightToLeft"; break;
        case MGSwipeStateExpandingLeftToRight: str = @"ExpandingLeftToRight"; break;
        case MGSwipeStateExpandingRightToLeft: str = @"ExpandingRightToLeft"; break;
    }
    NSLog(@"Swipe state: %@ ::: Gesture: %@", str, gestureIsActive ? @"Active" : @"Ended");
}

/*
- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    scrollOrientation = scrollView.contentOffset.y > lastPos.y?UIImageOrientationDown:UIImageOrientationUp;
    lastPos = scrollView.contentOffset;
}
*/
@end
