//
//  ViewController.h
//  SimpleSlideShow
//
//  Created by Franck PETRIZ on 21/10/2014.
//  Copyright (c) 2014 Keuha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *BigScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *MediumScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *SmallScrollView;

-(UIView *)CreateView:(NSString *)name xOrigin:(CGFloat)xOrigin height:(CGFloat)height width:(CGFloat)width;
@end

