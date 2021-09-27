//
//  main.swift
//  Algorithms
//
//  Created by lijianxin03 on 2021/9/26.
//

import Foundation

print("Hello, World!")

let heapSort = Heapsort()
var array = [7,3,8,5,1,2]
heapSort.sort(&array)
print(array)

