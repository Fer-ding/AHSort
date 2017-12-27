//
//  ViewController.m
//  AHSort
//
//  Created by YueHui on 2017/12/22.
//  Copyright © 2017年 Feer. All rights reserved.
//

#import "ViewController.h"
#import "AHSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AHSort *sort = [[AHSort alloc] init];
    [sort quickSortWithArray:@[@6,@1,@4,@8,@2,@7,@9,@5,@7]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
