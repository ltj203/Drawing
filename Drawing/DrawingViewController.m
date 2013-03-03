//
//  DrawingViewController.m
//  Drawing
//
//  Created by Lisa Jenkins on 3/1/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import "DrawingViewController.h"
#import "colorSample.h"
#import <QuartzCore/QuartzCore.h>

@interface DrawingViewController ()

@end

@implementation DrawingViewController
@synthesize passedImage, test;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    drawImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    drawImageView.backgroundColor = [UIColor clearColor];
    drawImageView.image = passedImage;
    [self.view addSubview:drawImageView];
    
    CGRect paletteFrame = CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width/4, self.view.frame.size.height/2);
    UIView *colorPalette = [[UIView alloc] initWithFrame:paletteFrame];
    colorPalette.backgroundColor = [UIColor grayColor];
    [self.view addSubview: colorPalette];
    
    CGRect colorFrame = CGRectMake(10, 10 + self.view.frame.size.height/6, paletteFrame.size.width, paletteFrame.size.width);
    red = [[colorSample alloc] initWithFrame: colorFrame];
    red.red = 1;
    red.green = 0;
    red.blue = 0;
    [self.view addSubview:red];
    
    colorFrame = CGRectMake(10, 10 + self.view.frame.size.height/6 + red.frame.size.height, paletteFrame.size.width, paletteFrame.size.width);
    green = [[colorSample alloc] initWithFrame: colorFrame];
    green.red = 0;
    green.green = 1;
    green.blue = 0;
    [self.view addSubview:green];
    
    colorFrame = CGRectMake(10, 10 + self.view.frame.size.height/6 + red.frame.size.height*2, paletteFrame.size.width, paletteFrame.size.width);
    blue = [[colorSample alloc] initWithFrame: colorFrame];
    blue.red = 0;
    blue.green = 0;
    blue.blue = 1;
    [self.view addSubview:blue];
    
    paletteFrame = CGRectMake(self.view.frame.size.width - paletteFrame.size.width, self.view.frame.size.height/6, self.view.frame.size.width/4, self.view.frame.size.height/2);
    UIView *sizePalette = [[UIView alloc] initWithFrame:paletteFrame];
    sizePalette.backgroundColor = [UIColor grayColor];
    [self.view addSubview: sizePalette];
    
    CGRect sizeFrame = CGRectMake(self.view.frame.size.width - paletteFrame.size.width*3/4, 20 + self.view.frame.size.height/6, paletteFrame.size.width/3, paletteFrame.size.width/3);
    small = [[colorSample alloc] initWithFrame:sizeFrame];
    small.red = 1;
    small.green = 1;
    small.blue = 1;
    [self.view addSubview:small];
    
    sizeFrame = CGRectMake(self.view.frame.size.width - paletteFrame.size.width*3/4, 10 + self.view.frame.size.height/6 + red.frame.size.height, paletteFrame.size.width*2/3, paletteFrame.size.width*2/3);
    medium = [[colorSample alloc] initWithFrame:sizeFrame];
    medium.red = 1;
    medium.green = 1;
    medium.blue = 1;
    [self.view addSubview:medium];
    
    sizeFrame = CGRectMake(self.view.frame.size.width - paletteFrame.size.width*3/4, 10 + self.view.frame.size.height/6 + red.frame.size.height*2, paletteFrame.size.width, paletteFrame.size.width);
    large = [[colorSample alloc] initWithFrame:sizeFrame];
    large.red = 1;
    large.green = 1;
    large.blue = 1;
    [self.view addSubview:large];
    
    currentColor = [UIColor colorWithRed:red.red green:red.green blue:red.blue alpha:1];
    brushSize = small.frame.size.width/2;
    
    paletteFrame = CGRectMake(self.view.frame.size.width/8, self.view.frame.size.height*5/6, self.view.frame.size.width*3/4, self.view.frame.size.height/6);
    UIView *imagesPalette = [[UIView alloc] initWithFrame:paletteFrame];
    imagesPalette.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imagesPalette];
    
    CGRect imageFrame = CGRectMake(10 + imagesPalette.frame.origin.x, 10 + imagesPalette.frame.origin.y, imagesPalette.frame.size.width/5, imagesPalette.frame.size.height*5/6);
    clover = [[UIImageView alloc] initWithFrame:imageFrame];
    clover.image = [UIImage imageNamed:@"clover.png"];
    [self.view addSubview:clover];
    
    imageFrame = CGRectMake(15 + imagesPalette.frame.origin.x + clover.frame.size.width, 10 + imagesPalette.frame.origin.y, imagesPalette.frame.size.width/5, imagesPalette.frame.size.height*5/6);
    egg = [[UIImageView alloc] initWithFrame:imageFrame];
    egg.image = [UIImage imageNamed:@"egg.png"];
    [self.view addSubview:egg];
    
    imageFrame = CGRectMake(20 + imagesPalette.frame.origin.x + clover.frame.size.width*2, 10 + imagesPalette.frame.origin.y, imagesPalette.frame.size.width/5, imagesPalette.frame.size.height*5/6);
    flower = [[UIImageView alloc] initWithFrame:imageFrame];
    flower.image = [UIImage imageNamed:@"flower.png"];
    [self.view addSubview:flower];
    
    imageFrame = CGRectMake(25 + imagesPalette.frame.origin.x + clover.frame.size.width*3, 10 + imagesPalette.frame.origin.y, imagesPalette.frame.size.width/5, imagesPalette.frame.size.height*5/6);
    rabbit = [[UIImageView alloc] initWithFrame:imageFrame];
    rabbit.image = [UIImage imageNamed:@"rabbit.png"];
    [self.view addSubview:rabbit];
    
    currentImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    infoButton.center = CGPointMake(self.view.frame.origin.x + self.view.frame.size.width*7/8, 12);
    [infoButton addTarget:self action:@selector(touchUpInsideInfo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
    
    clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    clearButton.frame = CGRectMake(self.view.frame.origin.x + self.view.frame.size.width*7/8 - 20, 28, self.view.frame.size.width/6, 40);
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton setTitleColor: [UIColor purpleColor] forState:UIControlStateNormal];
    [clearButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [clearButton addTarget:self action:@selector(touchUpInsideClear:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(self.view.frame.origin.x + 10, 28, self.view.frame.size.width/6, 40);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor: [UIColor purpleColor] forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [saveButton addTarget:self action:@selector(touchUpInsideSave:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(self.view.frame.origin.x + self.view.frame.size.width/2 - self.view.frame.size.width/12, 28, self.view.frame.size.width/6, 40);
    [back setTitle:@"Back" forState:UIControlStateNormal];
    [back setTitleColor: [UIColor purpleColor] forState:UIControlStateNormal];
    [back setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [back addTarget:self action:@selector(backToHome:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    leftObjects = [[NSMutableArray alloc] initWithObjects:colorPalette, red, green, blue, nil];
    rightObjects = [[NSMutableArray alloc] initWithObjects:sizePalette, small, medium, large, nil];
    bottomObjects = [[NSMutableArray alloc] initWithObjects:imagesPalette, clover, egg, flower, rabbit, nil];
    
    drawnImages = [[NSMutableArray alloc] init];
}

-(void) touchUpInsideInfo: (id) sender {
    UIView *tempPallet = [leftObjects objectAtIndex:0];
    if (CGRectIntersectsRect(tempPallet.frame, self.view.frame)) {
      [UIView animateWithDuration:2 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
          for (int i=0; i<leftObjects.count; i++) {
              UIView *tempPallet = [leftObjects objectAtIndex:i];
              //tempPallet.hidden = YES;
              tempPallet.center = CGPointMake(tempPallet.center.x-200, tempPallet.center.y);
          }
          for (int i=0; i<rightObjects.count; i++) {
              UIView *tempPallet = [rightObjects objectAtIndex:i];
              //tempPallet.hidden = YES;
              tempPallet.center = CGPointMake(tempPallet.center.x+200, tempPallet.center.y);
          }
          for (int i=0; i<bottomObjects.count; i++) {
              UIView *tempPallet = [bottomObjects objectAtIndex:i];
              //tempPallet.hidden = YES;
              tempPallet.center = CGPointMake(tempPallet.center.x, tempPallet.center.y+200);
          }
      } completion:nil];
        
    } else {
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationCurveEaseOut animations:^{
            for (int i=0; i<leftObjects.count; i++) {
                UIView *tempPallet = [leftObjects objectAtIndex:i];
                //tempPallet.hidden = NO;
                tempPallet.center = CGPointMake(tempPallet.center.x+200, tempPallet.center.y);
            }
            for (int i=0; i<rightObjects.count; i++) {
                UIView *tempPallet = [rightObjects objectAtIndex:i];
                //tempPallet.hidden = NO;
                tempPallet.center = CGPointMake(tempPallet.center.x-200, tempPallet.center.y);
            }
            for (int i=0; i<bottomObjects.count; i++) {
                UIView *tempPallet = [bottomObjects objectAtIndex:i];
                //tempPallet.hidden = NO;
                tempPallet.center = CGPointMake(tempPallet.center.x, tempPallet.center.y-200);
            }
        } completion:nil];
    }
    
}

-(void) touchUpInsideClear: (id) sender{
    drawImageView.image = nil;
    for (int i=0; i<drawnImages.count; i++) {
        UIImageView *temp = [drawnImages objectAtIndex:i];
        [temp removeFromSuperview];
    }
}

-(void) touchUpInsideSave: (id) sender {
    UIGraphicsBeginImageContext(drawImageView.bounds.size);
    [drawImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
}

-(void) backToHome: (id) sender {
    [self performSegueWithIdentifier:@"segueToStart" sender:self];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pt = [[touches anyObject] locationInView:drawImageView];
    CGRect ptRect = CGRectMake(pt.x, pt.y, 0.5, 0.5);
    
    if (CGRectIntersectsRect(ptRect, red.frame)) {
        currentColor = [UIColor colorWithRed:red.red green:red.green blue:red.blue alpha:1];
    }
    if (CGRectIntersectsRect(ptRect, green.frame)) {
        currentColor = [UIColor colorWithRed:green.red green:green.green blue:green.blue alpha:1];
    }
    if (CGRectIntersectsRect(ptRect, blue.frame)) {
        currentColor = [UIColor colorWithRed:blue.red green:blue.green blue:blue.blue alpha:1];
    }
    
    if (CGRectIntersectsRect(ptRect, small.frame)) {
        brushSize = small.frame.size.width/2;
    }
    if (CGRectIntersectsRect(ptRect, medium.frame)) {
        brushSize = medium.frame.size.width/2;
    }
    if (CGRectIntersectsRect(ptRect, large.frame)) {
        brushSize = large.frame.size.width/2;
    }
    
    if (CGRectIntersectsRect(ptRect, clover.frame)) {
        currentColor = [UIColor clearColor];
        currentImage.image = [UIImage imageNamed:@"clover.png"];
    }
    
    if (CGRectIntersectsRect(ptRect, egg.frame)) {
        currentColor = [UIColor clearColor];
        currentImage.image = [UIImage imageNamed:@"egg.png"];
    }
    
    if (CGRectIntersectsRect(ptRect, flower.frame)) {
        currentColor = [UIColor clearColor];
        currentImage.image = [UIImage imageNamed:@"flower.png"];
    }
    
    if (CGRectIntersectsRect(ptRect, rabbit.frame)) {
        currentColor = [UIColor clearColor];
        currentImage.image = [UIImage imageNamed:@"rabbit.png"];
    }
    
    startLocation = pt;
    lastPoint = [touch locationInView:drawImageView];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:drawImageView];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [drawImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    if (currentColor != [UIColor clearColor]) {
    CGContextSetLineWidth(c, brushSize);
    CGContextSetStrokeColorWithColor(c, currentColor.CGColor);
    CGContextSetLineCap(c, kCGLineCapRound);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(c, currentPoint.x, currentPoint.y);
    CGContextStrokePath(c);
    } else {
        UIImageView *temp = [[UIImageView alloc] initWithFrame:currentImage.frame];
        [drawnImages addObject:temp];
        temp.image = currentImage.image;
        temp.center = currentPoint;
        [drawImageView addSubview:temp];
    }
    
    drawImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint pt = [[touches anyObject] locationInView:drawImageView];
    CGRect firstTouchRect = CGRectMake(startLocation.x, startLocation.y, 0.5, 0.5);
    CGRect lastTouchRect = CGRectMake(pt.x, pt.y, 0.5, 0.5);
    
    CGFloat newRed;
    CGFloat newGreen;
    CGFloat newBlue;
    
    if (CGRectIntersectsRect(firstTouchRect, red.frame)) {
        if (CGRectIntersectsRect(lastTouchRect, red.frame)) {
            currentColor = [UIColor colorWithRed:red.red green:red.green blue:red.blue alpha:1];
        }
        if (CGRectIntersectsRect(lastTouchRect, green.frame)) {
            newRed = (red.red + green.red)/2;
            newGreen = (red.green + green.green)/2;
            newBlue = (red.blue + green.blue)/2;
            currentColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1];
        }
        if (CGRectIntersectsRect(lastTouchRect, blue.frame)) {
            newRed = (red.red + blue.red)/2;
            newGreen = (red.green + blue.green)/2;
            newBlue = (red.blue + blue.blue)/2;
            currentColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1];
        }
    }
    if (CGRectIntersectsRect(firstTouchRect, green.frame)) {
        if (CGRectIntersectsRect(lastTouchRect, green.frame)) {
            currentColor = [UIColor colorWithRed:green.red green:green.green blue:green.blue alpha:1];
        }
        if (CGRectIntersectsRect(lastTouchRect, red.frame)) {
            newRed = (red.red + green.red)/2;
            newGreen = (red.green + green.green)/2;
            newBlue = (red.blue + green.blue)/2;
            currentColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1];
        }
        if (CGRectIntersectsRect(lastTouchRect, blue.frame)) {
            newRed = (green.red + blue.red)/2;
            newGreen = (green.green + blue.green)/2;
            newBlue = (green.blue + blue.blue)/2;
            currentColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1];
        }
    }
    if (CGRectIntersectsRect(firstTouchRect, blue.frame)) {
        if (CGRectIntersectsRect(lastTouchRect, blue.frame)) {
            currentColor = [UIColor colorWithRed:blue.red green:blue.green blue:blue.blue alpha:1];
        }
        if (CGRectIntersectsRect(lastTouchRect, red.frame)) {
            newRed = (red.red + blue.red)/2;
            newGreen = (red.green + blue.green)/2;
            newBlue = (red.blue + blue.blue)/2;
            currentColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1];
        }
        if (CGRectIntersectsRect(lastTouchRect, green.frame)) {
            newRed = (green.red + blue.red)/2;
            newGreen = (green.green + blue.green)/2;
            newBlue = (green.blue + blue.blue)/2;
            currentColor = [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
