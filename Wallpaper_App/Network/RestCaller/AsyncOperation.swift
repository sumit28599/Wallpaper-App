//
//  AsyncOperation.swift
//  Wallpaper
//
//  Created by Mohd Haris on 11/11/24.
//

import Foundation
public class AsyncOperation: Operation {
    private let lockQueue = DispatchQueue(label: "com.core-module.asyncoperation", attributes: .concurrent)

    public override var isAsynchronous: Bool {
        return true
    }

    private var isExecutingInternal: Bool = false
    public override private(set) var isExecuting: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return isExecutingInternal
            }
        }
        set {
            willChangeValue(forKey: "isExecuting")
            lockQueue.sync(flags: [.barrier]) {
                isExecutingInternal = newValue
            }
            didChangeValue(forKey: "isExecuting")
        }
    }

    private var isFinishedInternal: Bool = false
    public override private(set) var isFinished: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return isFinishedInternal
            }
        }
        set {
            willChangeValue(forKey: "isFinished")
            lockQueue.sync(flags: [.barrier]) {
                isFinishedInternal = newValue
            }
            didChangeValue(forKey: "isFinished")
        }
    }

    public override func start() {
        guard !isCancelled else {
            finish()
            return
        }

        isFinished = false
        isExecuting = true
        main()
    }

    public override func main() {
        fatalError("Subclasses must implement `main` without overriding super.")
    }

    func finish() {
        isExecuting = false
        isFinished = true
    }
}
