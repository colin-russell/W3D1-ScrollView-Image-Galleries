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
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    imageView1.translatesAutoresizingMaskIntoConstraints = YES;
    imageView2.translatesAutoresizingMaskIntoConstraints = YES;
    imageView3.translatesAutoresizingMaskIntoConstraints = YES;
    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    [self.scrollView addSubview:imageView3];
    
    float maxHeight = 0;
    if (imageView1.bounds.size.height > imageView2.bounds.size.height && imageView1.bounds.size.height > imageView3.bounds.size.height) {
        maxHeight = imageView1.bounds.size.height;
    }else if (imageView2.bounds.size.height > imageView1.bounds.size.height && imageView2.bounds.size.height > imageView3.bounds.size.height) {
        maxHeight = imageView2.bounds.size.height;
    }else {
        maxHeight = imageView3.bounds.size.height;
    }
    
    CGSize size = CGSizeMake(imageView1.bounds.size.width+imageView2.bounds.size.width+imageView3.bounds.size.width, maxHeight);
    
    self.scrollView.contentSize = size;
    
}



@end
