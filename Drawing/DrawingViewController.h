//
//  DrawingViewController.h
//  Drawing
//
//  Created by Lisa Jenkins on 3/1/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "colorSample.h"

@interface DrawingViewController : UIViewController{
    UIColor *currentColor;
    float brushSize;
    CGPoint lastPoint;
    CGPoint startLocation;
    UIImageView *drawImageView;
    colorSample *red;
    colorSample *green;
    colorSample *blue;
    colorSample *small;
    colorSample *medium;
    colorSample *large;
    UIImageView *clover;
    UIImageView *egg;
    UIImageView *flower;
    UIImageView *rabbit;
    UIImageView *currentImage;
    UIButton *infoButton;
    UIButton *clearButton;
    UIButton *saveButton;
    NSMutableArray *leftObjects;
    NSMutableArray *rightObjects;
    NSMutableArray *bottomObjects;
    NSMutableArray *drawnImages;
}

@property (nonatomic) UIImage *passedImage;
@property (nonatomic) NSString *test;


-(void) touchUpInsideInfo: (id) sender;
-(void) touchUpInsideClear: (id) sender;
-(void) touchUpInsideSave: (id) sender;

@end
