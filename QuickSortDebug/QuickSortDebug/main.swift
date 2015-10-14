//
//  main.swift
//  QuickSortDebug
//
//  Created by liuyongjia on 15/10/14.
//  Copyright © 2015年 liuyongjia. All rights reserved.
//

import Foundation

print("Hello, World!")

var arr = [3, 1, 5, 2, 4]

func quickSort(var arr: [Int], start: Int, end: Int) {
    if start >= end {
        return
    }
    let mid = arr[end] 
    var left = start, right = end - 1
    while left < right {
        while (arr[left] < mid && left < right) {
            left++
        }
        while (arr[right] > mid && left < right) {
            right--
        }
        
        let tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
    }
    
    if arr[left] > arr[end] {
        let tmp = arr[left]
        arr[left] = arr[end]
        arr[end] = tmp
    } else {
        left++
    }
    quickSort(arr, start: start, end: left - 1)
    quickSort(arr, start: left + 1, end: end)
}

quickSort(arr, start: 0, end: arr.count - 1)