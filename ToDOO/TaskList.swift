//
//  TaskList.swift
//  ToDOO
//
//  Created by András Samu on 2019. 06. 14..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

struct TaskList : View {
    @EnvironmentObject var taskStore: TaskStore
    @State var newTaskDescription: String = ""
    var body: some View {
        List{
            HStack{
                TextField(self.$newTaskDescription, placeholder: Text("New task description"))
                Button(action: {
                    self.taskStore.tasks.append(Task(title: self.newTaskDescription, isFinished: false, id: Int.random(in: 0..<300)))
                    self.newTaskDescription = ""
                }){
                    Text("Add")
                }
            }
            ForEach(self.taskStore.tasks){ task in
                TaskCell(task: task)
            }
            .onDelete(perform: delete(at:))
            .onMove(perform: move(from:to:))
        }.animation(.basic())
       
    }
    
    func delete(at offsets: IndexSet) {
        offsets.sorted { $0 > $1 }.forEach { self.taskStore.tasks.remove(at: $0) }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        source.sorted { $0 > $1 }.forEach { self.taskStore.tasks.insert(self.taskStore.tasks.remove(at: $0), at: destination) }
    }
}

#if DEBUG
struct TaskList_Previews : PreviewProvider {
    static var previews: some View {
        TaskList().environmentObject(TaskStore.getInstance())
    }
}
#endif
