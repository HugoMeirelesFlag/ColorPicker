//
//  ColorSecondViewController.m
//  ColorPicker
//
//  Created by Developer on 13/04/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import "ColorSecondViewController.h"
#import "ViewController.h"

@interface ColorSecondViewController () <ColorMainDelegate>
@property (weak,nonatomic) IBOutlet UIView *colorview;
@end

@implementation ColorSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}

- (void)updateUI {
    self.colorview.backgroundColor = [self.secPrecolor uiColor];
    self.title = [self.secPrecolor titleColorDescription];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:UINavigationController.class]){
        UINavigationController *navViewController = segue.destinationViewController;
        ViewController *vc = navViewController.viewControllers.firstObject;
        vc.preDefColor = self.secPrecolor;
        vc.delegate = self;
        vc.title = @"Edit Color";
    }
}

- (void)didUpdateColor:(Color *)color{
    [self updateUI];
}

@end
