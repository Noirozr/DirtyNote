//: Playground - noun: a place where people can play
//: Sort functions implemen

import UIKit

var str = "Hello, playground"

//: SelectionSort - 选择排序
/**
Note:
    之前犯了一个错误，min 设置为 arr[i], 导致
    tmp = arr[i]
    arr[i] = min
    min = tmp
    之后并没有执行交换，而是用最小值覆盖
*/
func selectionsort(var arr: [Int]) -> [Int]{
    for i in 0..<arr.count {
        var min = i
        for j in i+1..<arr.count {
            if arr[j] < arr[min] {
                min = j
            }
        }
        let tmp = arr[i]
        arr[i] = arr[min]
        arr[min] = tmp

    }
    return arr
}


//: BubbleSort - 冒泡排序
/**
Note:
    一直忽视了相邻交换这条原则；每次循环，会排出一个最大值
*/
func bubbleSort(var arr: [Int]) -> [Int] {
    for i in 0..<arr.count - 1 {
        for j in 0..<arr.count - 1 - i {
            if arr[j] > arr[j + 1] {
                let tmp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = tmp
            }
        }
    }
    return arr
}

//: CocktailSort - 鸡尾酒排序
/**
Note: 从两头遍历
*/
func cocktailSort(var arr: [Int]) -> [Int] {
    var left = 0, right = arr.count - 1
    while left < right {
        for i in left..<right {
            if arr[i] > arr[i + 1] {
                let tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
            }
        }
        right--
        for (var i = right; i > left; i--) {
            if arr[i] < arr[i - 1] {
                let tmp = arr[i]
                arr[i] = arr[i - 1]
                arr[i - 1] = tmp
            }
        }
        left++
    }
    return arr
}

//: InsertionSort - 插入排序
/**
Note: 个人的心得是保持前面的 item 为排好序的状态
*/
func insertionSort(var arr: [Int]) -> [Int] {
    var j: Int = 0
    for i in 1..<arr.count {
        let temp = arr[i]
        for (j = i - 1; j >= 0 && arr[j] > temp; j--) {
            arr[j + 1] = arr[j]
        }
        arr[j + 1] = temp
    }
    return arr
}

//: Recursion Exercise
func Fibonacci(num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    if num == 2 {
        return 2
    } else {
        return Fibonacci(num - 1) + Fibonacci(num - 2)
    }
}
//: QuickSort - 快速排序
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

//: Comb Sort - 梳排序
func combSort(var arr: [Int]) -> [Int] {
    let shrink_factor = 0.8
    var gap = Double(arr.count), swapped = true
    while (gap > 1 || swapped) {
        if (gap > 1) {
            gap *= shrink_factor
        }
        swapped = false
        for (var i = 0; Int(gap) + i < arr.count; i++) {
            if arr[i] > arr[i + Int(gap)] {
                let tmp = arr[i]
                arr[i] = arr[i + Int(gap)]
                arr[i + Int(gap)] = tmp
                swapped = true
            }
        }
    }
    return arr
}

var arr = [3, 1, 5, 2, 4]

//: Test for Sort callback
selectionsort(arr)
bubbleSort(arr)
cocktailSort(arr)
insertionSort(arr)
combSort(arr)

Fibonacci(6)

quickSort(arr, start: 0, end: arr.count - 1)
