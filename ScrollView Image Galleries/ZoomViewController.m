//
//  ZoomViewController.m
//  ScrollView Image Galleries
//
//  Created by Colin on 2018-04-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "ZoomViewController.h"

@interface ZoomViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 5;
    self.scrollView.maximumZoomScale = 1;
    self.scrollView.userInteractionEnabled = YES;
    self.imageView = [[UIImageView alloc] initWithImage:self.imageToZoom];
    self.imageView.tag = 100;
     
    [self.scrollView addSubview:self.imageView];
    
    self.imageView.userInteractionEnabled = YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView viewWithTag:100];
}


@end
