//
//  AHSort.h
//  AHSort
//
//  Created by YueHui on 2017/12/22.
//  Copyright © 2017年 Feer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHSort : NSObject

// 快速排序
- (NSArray *)quickSortWithArray:(NSArray *)arrayData;

// 冒泡排序
- (NSArray *)bubbleSortWithArray:(NSArray *)arrayData;

// 选择排序
- (NSArray *)selectSortWithArray:(NSArray *)arrayData;

// 插入排序
- (NSArray *)insertSortWithArray:(NSArray *)arrayData;

// 堆排序
- (NSArray *)heapSortWithArray:(NSArray *)arrayData;

// 归并排序
- (NSArray *)mergeSortWithArray:(NSArray *)arrayData;

@end
