//
//  TaskStrore.swift
//  ToDOO
//
//  Created by András Samu on 2019. 06. 14..
//  Copyright © 2019. András Samu. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TaskStore: BindableObject {
    static let instance = TaskStore()
    var didChange = PassthroughSubject<TaskStore, Never>()
    var tasks: [Task] = [] {
        didSet{
            didChange.send(self)
        }
    }
    var showOnlyCompleted: Bool = false {
        didSet{
            didChange.send(self)
        }
    }
    
    private init() {
        #if DEBUG
        tasks.append(Task(title: "Task Uno", isFinished: false, id: 1))
        tasks.append(Task(title: "Task Dos", isFinished: true, id: 2))
        tasks.append(Task(title: "Task Tres", isFinished: false, id: 3))
        #endif
    }

    public static func getInstance() -> TaskStore {
        return instance
    }
    
    public func setTasks(tasks: [Task]) {
        self.tasks = tasks
    }
}
