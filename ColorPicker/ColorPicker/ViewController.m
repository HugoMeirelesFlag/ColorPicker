//
//  ViewController.m
//  ColorPicker
//
//  Created by Developer on 09/04/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import "ViewController.h"
#import "ColorMainViewController.h"
#import "Color.h"

@interface ViewController ()
@property (weak,nonatomic) IBOutlet UILabel *redLabel;
@property (weak,nonatomic) IBOutlet UILabel *blueLabel;
@property (weak,nonatomic) IBOutlet UILabel *greenLabel;
@property (weak,nonatomic) IBOutlet UISlider *redSlider;
@property (weak,nonatomic) IBOutlet UISlider *blueSlider;
@property (weak,nonatomic) IBOutlet UISlider *greenSlider;
@property (weak,nonatomic) IBOutlet UIStepper *redStepper;
@property (weak,nonatomic) IBOutlet UIStepper *blueStepper;
@property (weak,nonatomic) IBOutlet UIStepper *greenStepper;
@property (weak,nonatomic) IBOutlet UIView *colorview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float maxValueSlider = 255;
    float minValueSlider = 0;
    [self defineMinAndMaxValues:minValueSlider :maxValueSlider];
    [self changeColorView:[self.preDefColor uiColor]];
    [self changeRed:self.preDefColor.red];
    [self changeBlue:self.preDefColor.blue];
    [self changeGreen:self.preDefColor.green];
}

-(void)defineMinAndMaxValues:(float)newMin :(float)newMax{
    self.redSlider.minimumValue = newMin;
    self.greenSlider.minimumValue = newMin;
    self.blueSlider.minimumValue = newMin;
    self.redStepper.minimumValue = newMin;
    self.blueStepper.minimumValue = newMin;
    self.greenStepper.minimumValue = newMin;
    self.redSlider.maximumValue = newMax;
    self.greenSlider.maximumValue = newMax;
    self.blueSlider.maximumValue = newMax;
    self.redStepper.maximumValue = newMax;
    self.blueStepper.maximumValue = newMax;
    self.greenStepper.maximumValue = newMax;
}


-(IBAction)setSliderValue:(UISlider *)sender{
    if(sender == self.redSlider){
        [self changeRed:self.redSlider.value];
    }else if (sender == self.blueSlider){
        [self changeBlue:self.blueSlider.value];
    }else if (sender == self.greenSlider){
        [self changeGreen:self.greenSlider.value];
    }
    UIColor *newColor = [[UIColor alloc]initWithRed:self.redSlider.value/255 green:self.greenSlider.value/255 blue:self.blueSlider.value/255 alpha:1 ];
    [self changeColorView:newColor];
    
}

-(IBAction)setStepperValue:(UIStepper *)sender{
    if(sender == self.redStepper){
        [self changeRed:self.redStepper.value];
    }else if (sender == self.blueStepper){
        [self changeBlue:self.blueStepper.value];
    }else if (sender == self.greenStepper){
        [self changeGreen:self.greenStepper.value];
    }
    UIColor *newColor = [[UIColor alloc]initWithRed:self.redStepper.value/255 green:self.greenStepper.value/255 blue:self.blueStepper.value/255 alpha:1 ];
    [self changeColorView:newColor];
}


-(void)changeRed:(float)newValue{
    [self.redSlider setValue:newValue animated:YES];
    self.redStepper.value = newValue;
    self.redLabel.text=[NSString stringWithFormat:@"%0.f",newValue];
}

-(void)changeGreen:(float)newValue{
    [self.greenSlider setValue:newValue animated:YES];
    self.greenStepper.value = newValue;
    self.greenLabel.text=[NSString stringWithFormat:@"%0.f",newValue];
}

-(void)changeBlue:(float)newValue{
    [self.blueSlider setValue:newValue animated:YES];
    self.blueStepper.value = newValue;
    self.blueLabel.text=[NSString stringWithFormat:@"%0.f",newValue];
}


-(void)changeColorView:(UIColor *)newColor{
    self.colorview.backgroundColor = newColor;
}

-(IBAction)cancel:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)save:(id)sender{
    if(!self.preDefColor){
        Color *color = [Color new];
        [color setRed:self.redStepper.value green:self.greenStepper.value blue:self.blueStepper.value];
        [self.delegate addColor:color];
    }else{
        [self.preDefColor setRed:self.redStepper.value green:self.greenStepper.value blue:self.blueStepper.value];
        [self.delegate didUpdateColor:self.preDefColor];
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
