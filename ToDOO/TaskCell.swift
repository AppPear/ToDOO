//
//  TaskCell.swift
//  ToDOO
//
//  Created by András Samu on 2019. 06. 14..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

struct TaskCell : View {
    @EnvironmentObject var taskStore: TaskStore
    var task: Task
    var taskIndex: Int? {
        taskStore.tasks.firstIndex(where: {$0.id == self.task.id})
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            if(self.taskIndex != nil){
                HStack {
                    Button(action: {
                        self.taskStore.tasks[self.taskIndex!].isFinished.toggle()
                    }) {
                        Image(systemName: self.taskStore.tasks[self.taskIndex!].isFinished ? "checkmark.square": "square")
                            .imageScale(.large)
                            .animation(.spring())
                            .transition(.scale())
                    }
                    Text(self.taskStore.tasks[self.taskIndex!].title)
                        .font(.headline)
                        .strikethrough(self.taskStore.tasks[taskIndex!].isFinished)
                    Spacer()
                }
                HStack{
                    Text(self.taskStore.tasks[self.taskIndex!].priority.rawValue)
                    .font(.footnote)
                        .padding(.leading, 30)
                }
            }
        }.padding([.bottom,.top], 2)
    }
}

#if DEBUG
struct TaskCell_Previews : PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task(title: "Task Uno", isFinished: false, id: 1)).environmentObject(TaskStore.getInstance()).frame(height: 80)
    }
}
#endif
