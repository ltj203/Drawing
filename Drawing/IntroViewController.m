//
//  IntroViewController.m
//  Drawing
//
//  Created by Lisa Jenkins on 3/2/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import "IntroViewController.h"
#import "DrawingViewController.h"

@interface IntroViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)blankCanvas:(UIButton *)sender {
    [self performSegueWithIdentifier:@"segueToDraw" sender:self];
}

- (IBAction)pickPhoto:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void) imagePickerController: (UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:^{
        [self performSegueWithIdentifier:@"segueToDraw" sender:self];
    }];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DrawingViewController *controller = (DrawingViewController *)segue.destinationViewController;
    controller.passedImage = imageView.image;
    controller.test = testString;
    
}


- (IBAction)takePhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
