//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Colin on 2018-04-23.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImageViews];
    
}

- (void)setupImageViews {
    
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
    self.scrollView.contentSize = size;
    
    [NSLayoutConstraint activateConstraints:
     @[
       [imageView1.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor],
       [imageView2.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor],
       [imageView3.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor]
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
    
    
    
    
    
    
    
//        self.scrollView.translatesAutoresizingMaskIntoConstraints = YES;
//        [NSLayoutConstraint activateConstraints:
//         @[
//           [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
//           [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
//           [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
//           [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
//           ]
//         ];
//
//    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
//    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
//    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
//    imageView1.translatesAutoresizingMaskIntoConstraints = YES;
//    imageView2.translatesAutoresizingMaskIntoConstraints = YES;
//    imageView3.translatesAutoresizingMaskIntoConstraints = YES;
//
//
////    float maxHeight = 0;
////    if (imageView1.bounds.size.height > imageView2.bounds.size.height && imageView1.bounds.size.height > imageView3.bounds.size.height) {
////        maxHeight = imageView1.bounds.size.height;
////    }else if (imageView2.bounds.size.height > imageView1.bounds.size.height && imageView2.bounds.size.height > imageView3.bounds.size.height) {
////        maxHeight = imageView2.bounds.size.height;
////    }else {
////        maxHeight = imageView3.bounds.size.height;
////    }
//    CGSize size = CGSizeMake(imageView1.bounds.size.width+imageView2.bounds.size.width+imageView3.bounds.size.width, self.view.bounds.size.height);
//
//    self.scrollView.contentSize = size;
//    // constraints
//    imageView1.contentMode = UIViewContentModeScaleAspectFill;
//    imageView2.contentMode = UIViewContentModeScaleAspectFill;
//    imageView3.contentMode = UIViewContentModeScaleAspectFill;
//
//
//
//        [NSLayoutConstraint activateConstraints:
//         @[
//           [imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
//           [imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
//           [imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
//           [imageView2.leadingAnchor constraintEqualToAnchor:imageView1.trailingAnchor],
//           [imageView2.topAnchor constraintEqualToAnchor:imageView1.topAnchor],
//           [imageView2.bottomAnchor constraintEqualToAnchor:imageView1.bottomAnchor],
//           [imageView3.leadingAnchor constraintEqualToAnchor:imageView2.trailingAnchor],
//           [imageView3.topAnchor constraintEqualToAnchor:imageView2.topAnchor],
//           [imageView3.bottomAnchor constraintEqualToAnchor:imageView2.bottomAnchor],
//           [imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor]
//           ]
//         ];
//
//
//    [self.scrollView addSubview:imageView1];
//    [self.scrollView addSubview:imageView2];
//    [self.scrollView addSubview:imageView3];
//
//
//
}

- (void)setupScrollView {
    
}

@end
