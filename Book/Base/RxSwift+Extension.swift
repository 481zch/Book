//
//  RxSwift+Extension.swift
//  Book
//
//  Created by zangconghui on 2025/8/29.
//

import RxSwift
import RxCocoa

public extension ObservableType {
    func subscribeNext(_ closure: @escaping (Element) -> Void) -> Disposable {
        return self.subscribe(onNext: closure)
    }

    func subscribeError(_ closure: @escaping (Error) -> Void) -> Disposable {
        return self.subscribe(onError: closure)
    }

    func subscribeCompleted(_ closure: @escaping () -> Void) -> Disposable {
        return self.subscribe(onCompleted: closure)
    }
}
