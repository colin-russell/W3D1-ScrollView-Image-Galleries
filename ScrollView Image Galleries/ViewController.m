//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Colin on 2018-04-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "ViewController.h"
#import "ZoomViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupPageControl];
    self.scrollView.delegate = self;
    
}

- (void)setupViews {
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    imageView1.clipsToBounds = YES;
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.clipsToBounds = YES;
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    imageView3.clipsToBounds = YES;
    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    [self.scrollView addSubview:imageView3];
    imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    imageView3.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGSize size = CGSizeMake(imageView1.bounds.size.width+imageView2.bounds.size.width+imageView3.bounds.size.width, self.view.bounds.size.height);
    NSLog(@"%f",size.height);
    self.scrollView.contentSize = size;
    self.scrollView.pagingEnabled = YES;
    
    [NSLayoutConstraint activateConstraints:
     @[
       [imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
       [imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
       [imageView3.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
       [imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
       [imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
       [imageView3.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
       ]
     ];
    
    [NSLayoutConstraint activateConstraints:
     @[
       [imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
       [imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
       [imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
       [imageView2.leadingAnchor constraintEqualToAnchor:imageView1.trailingAnchor],
       [imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
       [imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
       [imageView3.leadingAnchor constraintEqualToAnchor:imageView2.trailingAnchor],
       [imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
       [imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
       [imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor]
       ]
     ];
    
    
    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    [self.scrollView addSubview:imageView3];
    
    imageView1.userInteractionEnabled = YES;
    imageView2.userInteractionEnabled = YES;
    imageView3.userInteractionEnabled = YES;
    SEL selector = @selector(handleTapGesture:);
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    [imageView1 addGestureRecognizer:tapGestureRecognizer1];
    [imageView2 addGestureRecognizer:tapGestureRecognizer2];
    [imageView3 addGestureRecognizer:tapGestureRecognizer3];
    
    
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    UIImageView *imageView = (UIImageView*)sender.view;
    UIImage *image = imageView.image;
    [self performSegueWithIdentifier:@"zoomSegue" sender:image];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ZoomViewController *zoomViewController = (ZoomViewController*)segue.destinationViewController;
    zoomViewController.imageToZoom = sender;
}

- (void)setupPageControl {
    UIPageControl *pageControl = [UIPageControl new];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    self.pageControl.layer.zPosition = 10;
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     @[
       [self.pageControl.heightAnchor constraintEqualToConstant:30],
       [self.pageControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
       [self.pageControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
       [self.pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
       ]
     ];
    
    self.pageControl.alpha = 0.5;
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.numberOfPages = 3;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float pageWidth = self.scrollView.contentSize.width/3;
    if (scrollView.bounds.origin.x < pageWidth) {
        self.pageControl.currentPage = 0;
    } else if (scrollView.bounds.origin.x == pageWidth){
        self.pageControl.currentPage = 1;
    } else if (scrollView.bounds.origin.x == 2*pageWidth){
        self.pageControl.currentPage = 2;
    }
}

@end
