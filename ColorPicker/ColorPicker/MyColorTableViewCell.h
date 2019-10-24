//
//  MyColorTableViewCell.h
//  ColorPicker
//
//  Created by Developer on 27/04/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyColorTableViewCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UIView *colorview;
@property (strong,nonatomic) IBOutlet UILabel *label;
@end

NS_ASSUME_NONNULL_END
