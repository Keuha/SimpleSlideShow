//
//  ViewController.m
//  SimpleSlideShow
//
//  Created by Franck PETRIZ on 21/10/2014.
//  Copyright (c) 2014 Keuha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Set size and position of your scrollView
    self.BigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height / 2)];
    
    //Add scrollView to self.View
    [self.view addSubview:self.BigScrollView];
    
    //Add Pictures to ScrollView
    [self feedView:self.BigScrollView];
    
    //Set size and position of your scrollView
    self.MediumScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height / 2, self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    
    //Add scrollView to self.View
    [self.view addSubview:self.MediumScrollView];
    
    //Add Pictures to ScrollView
    [self feedView:self.MediumScrollView];
    
    //Set size and position of your scrollView
    self.SmallScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, self.view.frame.size.width / 2, self.view.frame.size.height / 4)];
    
    //Add scrollView to self.View
    [self.view addSubview:self.SmallScrollView];
    
    //Add Pictures to ScrollView
    [self feedView:self.SmallScrollView];
    
    //Uncomment this to create an automatic slide in scrollView
    [NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}

-(void)feedView:(UIScrollView*)scrollView
{
    NSArray *pics = @[@"BlueBird.jpg", @"JackRussel.jpg", @"popCorn.jpg"];

    int i = 0;
    for (; i < pics.count; i++)
    {
        [scrollView addSubview:[self CreateView:[pics objectAtIndex:i]
        xOrigin:(i * scrollView.frame.size.width)
        height: scrollView.frame.size.height
        width: scrollView.frame.size.width]];
    }
    scrollView.pagingEnabled = YES;
    [scrollView setAlwaysBounceVertical:NO];
    
    
    //inform scrollView about his real new size, allow us to scroll between pictures
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * i, scrollView.frame.size.height);
}

-(UIView *)CreateView:(NSString *)name xOrigin:(CGFloat)xOrigin height:(CGFloat)height width:(CGFloat)width {
    
    //Create UIImage with name of the picture
    UIImage *Pics = [UIImage imageNamed:name];
    
    //Create UIImageView with ScrollView size to fit
    UIImageView *ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0, width, height)];
    ImageView.contentMode = UIViewContentModeScaleToFill;
    
    //Add UIImage to UIImageView
    [ImageView setImage:Pics];
    return (ImageView);
}


- (void) onTimer
{
    static unsigned int i = 0;
    static Boolean way = true;
    unsigned long where =  self.BigScrollView.bounds.size.width;
    
    //check if go left or right
    if (way)
    {
        i++;
        // check if it is possible to scroll more
        if (i * where < self.BigScrollView.contentSize.width)
        {
            CGPoint offset = [self.BigScrollView contentOffset];
            offset.x = i * where;
            [self.BigScrollView setContentOffset:offset animated:YES];
        }
        //if it is not, set Bollean to false, go on the other side
        if (i * where == self.BigScrollView.contentSize.width - where)
            way = false;
    }
    else
    {
        // check if it is possible to scroll more
        i--;
        CGPoint offset = [self.BigScrollView contentOffset];
        offset.x = where * i;
        [self.BigScrollView setContentOffset:offset animated:YES];
        //if it is not, set Bollean to true, go on the other side
        if (i == 0)
            way = true;
    }
}

         
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
