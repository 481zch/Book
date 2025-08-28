//
//  PriorityQueue.swift
//  Book
//
//  Created by zangconghui on 2025/8/25.
//

class Heap<T: Comparable> {
    var heap = [T]()
    
    func get() -> T {
        guard let first = heap.first else {
            fatalError("heap is empty")
        }
        return first
    }
    
    func insert(_ value: T) {
        heap.append(value)
        upHeap(heap.count - 1)
    }
    
    func downHeap(_ index: Int) {
        fatalError("Must override")
    }
    
    func upHeap(_ index: Int) {
        fatalError("Must override")
    }
}

class MaxHeap<T: Comparable>: Heap<T> {
    
    override func downHeap(_ index: Int) {
        let left = index * 2 + 1
        let right = index * 2 + 2
        var largest = index
        
        if left < heap.count && heap[left] > heap[largest] { largest = left }
        if right < heap.count && heap[right] > heap[largest] { largest = right }
        
        if largest != index {
            heap.swapAt(index, largest)
            downHeap(largest)
        }
    }
    
    override func upHeap(_ index: Int) {
        guard index > 0 else { return }
        let parent = (index - 1) / 2
        if heap[index] > heap[parent] {
            heap.swapAt(index, parent)
            upHeap(parent)
        }
    }
}
