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
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 100;
    self.scrollView.userInteractionEnabled = YES;
    self.imageView = [[UIImageView alloc] initWithImage:self.imageToZoom];
    
    self.scrollView.contentSize = self.imageToZoom.size;
    [self.scrollView addSubview:self.imageView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
