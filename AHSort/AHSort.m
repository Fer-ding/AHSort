//
//  AHSort.m
//  AHSort
//
//  Created by YueHui on 2017/12/22.
//  Copyright © 2017年 Feer. All rights reserved.
//

#import "AHSort.h"

@implementation AHSort

#pragma mark - 快速排序
/**
 
 1. 从数列中挑出一个元素，称为 "基准"（pivot），
 
 2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分割之后，该基准是它的最后位置。这个称为分割（partition）操作。
 
 3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
 
 递回的最底部情形，是数列的大小是零或一，也就是永远都已经被排序好了。虽然一直递回下去，但是这个算法总会结束，因为在每次的迭代（iteration）中，它至少会把一个元素摆到它最后的位置去。
 
 平均时间复杂度：O(n^2)
 
 平均空间复杂度：O(nlogn)       O(nlogn)~O(n^2)
 
*/

- (NSArray *)quickSortWithArray:(NSArray *)arrayData {
    NSMutableArray *arr = [arrayData mutableCopy];
    [self quickSortWithArray:arr  leftIndex:0 rightIndex:arrayData.count - 1];
    return arr.copy;
}

- (void)quickSortWithArray:(NSMutableArray *)arrayData leftIndex:(NSUInteger)leftIndex rightIndex:(NSUInteger)rightIndex {
    
    // 如果数组长度为0或1时返回
    if (leftIndex >= rightIndex) {
        return;
    }
    
    NSUInteger i = leftIndex;
    NSUInteger j = rightIndex;
    // 记录比较基准数
    NSInteger key = [arrayData[i] integerValue];
    
    while (i < j) {
        // 首先从右边j开始查找比基准数小的值
        while (i < j && [arrayData[j] integerValue] >= key) {
            // 如果比基准数大，继续查找
            j--;
        }
        
        // 如果比基准数小，则将查找到的小值调换到i的位置
        arrayData[i] = arrayData[j];
        
        // 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值
        while (i < j && [arrayData[i] integerValue]  <= key) {
            // 如果比基准数小，继续查找
            i++;
        }
        
        // 如果比基准数大，则将查找到的大值调换到j的位置
        arrayData[j] = arrayData[i];
    }
    
    // 将基准数放到正确位置
    arrayData[i] = @(key);
    
    // 递归排序
    // 排序基准数左边的
    [self quickSortWithArray:arrayData leftIndex:leftIndex rightIndex:i - 1];
    // 排序基准数右边的
    [self quickSortWithArray:arrayData leftIndex:i + 1 rightIndex:rightIndex];
}

#pragma mark - 冒泡排序
/**
 **思路: 每次循环比较前后两个数的大小，比较完交换两个数在数组中的位置，进入下一次循环，一次循环完成可以确定完成一个数的排序。
 因为每次比较的是前后两个数，所以循环次数为数组的总个数-1.
 **
 1. 首先将所有待排序的数字放入工作列表中。
 
 2. 从列表的第一个数字到倒数第二个数字，逐个检查：若某一位上的数字大于他的下一位，则将它与它的下一位交换。
 
 3. 重复2号步骤(倒数的数字加1。例如：第一次到倒数第二个数字，第二次到倒数第三个数字，依此类推...)，直至再也不能交换。
 
 平均时间复杂度：O(n^2)
 
 平均空间复杂度：O(1)
 
*/

- (NSArray *)bubbleSortWithArray:(NSArray *)arrayData {
    
    NSMutableArray *arr = [arrayData mutableCopy];
    NSUInteger i, j;
    
    BOOL flag = NO; //记录是否存在交换
    
    for (i = 0; i < arr.count - 1; i++) { //循环次数
        
        flag = NO;
        for (j = 0; j < arr.count - 1 - i; j++) { //循环体
            
            if (arr[j] > arr[j + 1]) {
                
                flag = YES;
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
        
        if (!flag) { //上一次循环比较中不存在交换，则退出排序
            break;
        }
    }
    return arr.copy;
}

#pragma mark - 选择排序
/**
 选择排序的思路：每一趟扫描选取剩下的元素中一个最大的放在后边。他与冒泡排序的区别在于，在扫描的过程中，只是保留选中元素的下标，而并不是将元素进行位移。更换选中的数据也只是更换一下下标的值，中间不会产生数据移动。所以在效率上会高很多很多。
 */
- (NSArray *)selectSortWithArray:(NSArray *)arrayData {
    
    NSMutableArray *arr = [arrayData mutableCopy];
    NSUInteger i, j, min;
    
    for (i = 0; i < arr.count; i++) {
        
        min = i; //记录最小值的下标
        for (j = i + 1; j < arr.count; j++) {
            
            if (arr[min] > arr[j]) {
                min = j; //比较结果，重新记录最小值的下标
            }
        }
        
        //一次循环完成，如果min的值改变了，则交换下标 i 和下标 j 的值
        if (min != i) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    return arr.copy;
}

#pragma mark - 插入排序
/**
 从第二个开始，取出该位置的值为临时值temp，位置为j，此时j的位置为空，叫做坑，然后temp依次往前比较，直到找到比temp小，把temp插入该的位置，完成一次循环。
 */

- (NSArray *)insertSortWithArray:(NSArray *)arrayData {
    
    NSMutableArray *arr = [arrayData mutableCopy];
    NSUInteger i, j;
    
    for (i = 1; i < arr.count; i++) {
        
        j = i;  /* j是一个坑， 确定坑的位置，再把数从坑里取出来，注意顺序*/
        id temp = arr[i];  /* temp 是从坑里取数*/
        if (arr[i] < arr[i - 1]) {  /* j > 0 防止越界。写&&前面效率更高*/
            temp = arr[i];
            while (j > 0 && [temp intValue] < [arr[j - 1] intValue]) {
                arr[j] = arr[j - 1];
                j--;
            }
            arr[j] = temp;
        }
    }
    return arr.copy;
}

#pragma mark - heapSort
- (NSArray *)heapSortWithArray:(NSArray *)arrayData {
    
    NSMutableArray *arr = [arrayData mutableCopy];
    NSInteger i ,size;
    size = arrayData.count;
    //找出最大的元素放到堆顶
    for (i= arrayData.count / 2; i >= 0; i--) {
        [self createBiggesHeap:arr withSize:size beIndex:i];
    }
    
    while(size > 0){
        [arr exchangeObjectAtIndex:size - 1 withObjectAtIndex:0]; //将根(最大) 与数组最末交换
        size-- ;//树大小减小
        [self createBiggesHeap:arr withSize:size beIndex:0];
    }
    return arr.copy;
}

- (void)createBiggesHeap:(NSMutableArray *)list withSize:(NSInteger) size beIndex:(NSInteger)element {
    
    NSInteger lchild = element * 2 + 1, rchild = lchild + 1; //左右子树
    while (rchild < size) { //子树均在范围内
        if (list[element] >= list[lchild] && list[element] >= list[rchild]) {
            return; //如果比左右子树都大，完成整理
        }
        if (list[lchild] > list[rchild]) { //如果左边最大
            [list exchangeObjectAtIndex:element withObjectAtIndex:lchild]; //把左面的提到上面
            element = lchild; //循环时整理子树
        }
        else {//否则右面最大
            [list exchangeObjectAtIndex:element withObjectAtIndex:rchild];
            element = rchild;
        }
        
        lchild = element * 2 +1;
        rchild = lchild + 1; //重新计算子树位置
    }
    //只有左子树且子树大于自己
    if (lchild < size && list[lchild] > list[element]) {
        [list exchangeObjectAtIndex:lchild withObjectAtIndex:element];
    }
}

#pragma mark - mergeSort

- (NSArray *)mergeSortWithArray:(NSArray *)arrayData {
    
    if(arrayData.count <= 1) {
//        return arrayData;
    }
    
    NSInteger mid = arrayData.count / 2;
    NSArray *leftArray = [self mergeSortWithArray:[arrayData subarrayWithRange:NSMakeRange(0, mid)]];
    NSArray *rightArray = [self mergeSortWithArray:[arrayData subarrayWithRange:NSMakeRange(mid,arrayData.count - mid)]];
    
    return [self mergeWithLeftArray:leftArray rightArray:rightArray];
}

- (NSArray *)mergeWithLeftArray:(NSArray *)leftArray rightArray:(NSArray *)rigthArray {
    
    int l = 0;
    int r = 0;
    NSMutableArray *resultArray = [NSMutableArray array];
    
    while (l < leftArray.count && r < rigthArray.count) {
        if (leftArray[l] < rigthArray[r]) {
            [resultArray addObject:leftArray[l++]];
        }
        else{
            [resultArray addObject:rigthArray[r++]];
        }
    }
    
    [resultArray addObject:(leftArray.lastObject > rigthArray.lastObject) ? leftArray.lastObject : rigthArray.lastObject];
    
    return resultArray;
}

@end
