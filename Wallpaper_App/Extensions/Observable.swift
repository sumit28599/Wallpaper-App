//
//  Observable.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            for item in self.listener {
                item?(value)
            }
        }
    }
    private var listener: [((T) -> Void)?] = []

    init(_ value: T) {
        self.value = value
    }
    func bind(_ closure: @escaping (T) -> Void) {
        listener.append(closure)
    }
}
