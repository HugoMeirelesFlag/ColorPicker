//
//  Color.h
//  ColorPicker
//
//  Created by Hugo Meireles on 01/05/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Color : NSObject
@property (nonatomic) CGFloat red;
@property (nonatomic) CGFloat green;
@property (nonatomic) CGFloat blue;

- (UIColor *)uiColor;
- (NSString *)colorDescription;
- (NSString *)titleColorDescription;

- (void)setRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
@end

NS_ASSUME_NONNULL_END
