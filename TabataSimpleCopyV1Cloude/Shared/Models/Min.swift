//
//  Min.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 02/10/2025.
//

@propertyWrapper
struct Min<T: Comparable> {
    var min: T
    var value: T

    init(wrappedValue: T, _ min: T) {
        value = wrappedValue
        self.min = min
    }

    var wrappedValue: T {
        get { value }
        set {
            if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}
