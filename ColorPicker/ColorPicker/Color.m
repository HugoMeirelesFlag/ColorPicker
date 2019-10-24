//
//  Color.m
//  ColorPicker
//
//  Created by Hugo Meireles on 01/05/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import "Color.h"

@implementation Color
- (UIColor *)uiColor {
    return [UIColor colorWithRed:self.red/255.0 green:self.green/255.0 blue:self.blue/255.0 alpha:1];
}

- (NSString *)colorDescription {
    return [NSString stringWithFormat:@" R:%0.f \n G:%0.f \n B:%0.f", self.red, self.green, self.blue];
}

- (NSString *)titleColorDescription {
    return [NSString stringWithFormat:@" R:%0.f  G:%0.f  B:%0.f", self.red, self.green, self.blue];
}



- (void)setRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    self.red = red;
    self.green = green;
    self.blue = blue;
}
@end
