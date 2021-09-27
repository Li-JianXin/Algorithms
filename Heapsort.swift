//
//  Heapsort.swift
//  Algorithms
//
//  Created by lijianxin03 on 2021/9/26.
//

// https://www.cnblogs.com/lanhaicode/p/10546257.html

import Foundation

class Heapsort: NSObject {
    
    // 大顶堆定义
    // arr[i] >= arr[2i+1] && arr[i] >= arr[2i +2]
    // 大顶堆是一棵完全二叉树，其就是利用完全二叉树的特性来维护一组数组
    // i做为一个节点，2i正好是其子节点，2i+1为其左子节点，2i+2为其右子节点
    // 定义的含义，在大顶堆中，每个父节点都大于其任一个子节点
    
    // 反推可知小顶堆的定义
    // arr[i] <= arr[2i+1] && arr[i] <= arr[2i+2]
    
    // 升序->大顶堆  降序->小顶堆
    
//    （假设我们想要升序的排列）
//    第一步：先n个元素的无序序列，构建成大顶堆
//    第二步：将根节点与最后一个元素交换位置，（将最大元素"沉"到数组末端）
//    第三步：交换过后可能不再满足大顶堆的条件，所以需要将剩下的n-1个元素重新构建成大顶堆
//    第四步：重复第二步、第三步直到整个数组排序完成
    
    func sort(_ array: inout [Int]) {
        for i in stride(from: array.count, to: 0, by: -1) {
            buildMaxHeap(&array, i)
            swap(&array, i)
        }
        
        /*
        倒序自定义步长遍历另一种写法
        var i = array.count
        while i > 0 {
            buildMaxHeap(&array, i)
            swap(&array, i)
            i -= 1
        }
        */
        
        for i in 0..<array.count {
            print("\(array[i])")
        }
    }
  
    // 构建大顶堆
    func buildMaxHeap(_ heap: inout [Int], _ length: Int) {
        var i = length/2 - 1
        var temp: Int
        
        while i >= 0 {
            // 前置条件防止越界
            if (2*i + 1) < length && heap[i] < heap[2*i + 1] {  // 根节点小于左子节点
                temp = heap[i]  // 根节点
                heap[i] = heap[2*i + 1]
                heap[2*i + 1] = temp
                
                // 检查交换后左子树是否满足大顶堆要求,如果不满足，重新调整子树结构
                let childNodeIndex = 2 * (2*i + 1)  // 子树初始索引
                let leftTreeCondition = (childNodeIndex + 1 < length && heap[2*i + 1] < heap[childNodeIndex + 1])
                let rightTreeCondition = (childNodeIndex + 2 < length && heap[2*i + 1] < heap[childNodeIndex + 2])
                if (leftTreeCondition || rightTreeCondition) {
                    buildMaxHeap(&heap, length)
                }
            }
            
            if (2*i + 2) < length && heap[i] < heap[2*i + 2] {  // 根节点小于右子节点
                temp = heap[i]  // 根节点
                heap[i] = heap[2*i + 2]
                heap[2*i + 2] = temp
                
                // 检查交换后右子树是否满足大顶堆
                let childNodeIndex = 2 * (2*i + 2)  // 子树初始索引
                let leftTreeCondition = (childNodeIndex + 1 < length && heap[2*i + 2] < heap[childNodeIndex + 1])
                let rightTreeCondition = (childNodeIndex + 2 < length && heap[2*i + 2] < heap[childNodeIndex + 2])
                if leftTreeCondition || rightTreeCondition {
                    buildMaxHeap(&heap, length)
                }
            }
            
           i -= 1
        }
        
    }
    
    // 交换根节点与数组末尾元素的值
    func swap(_ heap: inout [Int], _ length: Int) {
        let temp = heap[0]
        heap[0] = heap[length - 1]
        heap[length - 1] = temp
    }
    
}

/*
func sort(_ array: inout [Int]) {
    // 1.构建大顶堆
    let length = array.count
    var i = length/2 - 1
    while i >= 0 {
        // 从第一个非叶子节点从下至上,从右至左调整结构
        adjustHeap(&array, &i, length)
        i-=1
    }
    // 2.调整堆结构+交换堆顶元素与末尾元素
    var j = length/2 - 1
    var zero = 0
    while j > 0 {
        swap(&array, 0, j)  // 将堆顶元素与末尾元素进行交换
        adjustHeap(&array, &zero, j) // 重新对堆进行调整
        j-=1
    }
}

func adjustHeap(_ array: inout [Int], _ i: inout Int, _ length: Int) {
    let temp = array[i]  // 取出当前元素i
    var k = i*2 + 1  // 从i节点的左子节点开始，也就是2i+1处开始
    while k < length {
        // 如果左子节点小于右子节点，k指向右子节点
        if k+1 < length && array[k] < array[k+1] {
            k+=1
        }
        // 如果子节点大于父节点，将子节点赋值给父节点
        if array[k] > temp {
            array[i] = array[k]
            i = k
        } else {
            break
        }
        array[i] = temp  // 将temp放到最后位置
        k = k*2 + 1
    }
}
 
func swap(_ array: inout [Int], _ a: Int, _ b: Int) {
     let temp = array[a]
     array[a] = array[b]
     array[b] = temp
 }
 
*/
