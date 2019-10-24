//
//  ViewController.h
//  ColorPicker
//
//  Created by Developer on 09/04/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Color.h"
@protocol ColorMainDelegate <NSObject>
@optional
- (void)addColor:(Color *)newColor;
- (void)didUpdateColor:(Color *)color;

@end
@interface ViewController : UIViewController
@property (weak, nonatomic) id <ColorMainDelegate> delegate;
@property (strong,nonatomic) Color *preDefColor;
@end


