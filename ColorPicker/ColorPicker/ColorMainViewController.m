//
//  ColorMainViewController.m
//  ColorPicker
//
//  Created by Developer on 13/04/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

#import "ColorMainViewController.h"
#import "ColorSecondViewController.h"
#import "MyColorTableViewCell.h"
#import "Color.h"

@interface ColorMainViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray <Color *> *colors;
@property (weak,nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ColorMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.colors = [NSMutableArray new];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI {
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.colorview.backgroundColor = [self.colors[indexPath.row] uiColor];
    cell.label.text = [self.colors[indexPath.row] colorDescription];
    return cell;
}

- (void)addColor:(Color *)newColor{
    [self.colors addObject:newColor];
    [self.tableView reloadData];
    /*self.colorview.backgroundColor = newColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
    self.label.text = [NSString stringWithFormat:@"R:%0.f  G:%0.f  B:%0.f",red*255,green*255,blue*255];*/
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"colorSecond" sender:indexPath];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if(indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass:UINavigationController.class]){
        UINavigationController *navViewController = segue.destinationViewController;
        ViewController *vc = navViewController.viewControllers.firstObject;
        vc.delegate = self;
        vc.title = @"Add color";
    }else if([segue.destinationViewController isKindOfClass:ColorSecondViewController.class]){
        ColorSecondViewController *secondvc = segue.destinationViewController;
        NSIndexPath *path = sender;
        Color *color = self.colors[path.row];
        secondvc.secPrecolor = color;
        secondvc.title = [secondvc.secPrecolor titleColorDescription];
    }
}

@end
