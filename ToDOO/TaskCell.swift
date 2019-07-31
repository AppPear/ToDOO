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
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        ZStack{
            Rectangle()
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0, y: 0.5),
                endPoint: .init(x: 0.7, y: 0.6)
            ))
            .cornerRadius(20)
            VStack(alignment: .leading, spacing: 5){
                if(self.taskIndex != nil){
                    HStack {
                        Button(action: {
                            print("Pushed")
                            self.taskStore.tasks[self.taskIndex!].isFinished.toggle()
                        }) {
                            Image(systemName: self.taskStore.tasks[self.taskIndex!].isFinished ? "checkmark.square": "square")
                                .imageScale(.large)
                                .animation(.spring())
                                .transition(.scale())
                        }.foregroundColor(Color.white)
                        Text(self.taskStore.tasks[self.taskIndex!].title)
                            .fontWeight(.heavy)
                            .strikethrough(self.taskStore.tasks[taskIndex!].isFinished)
                            .foregroundColor(Color.white)
                            .lineLimit(3)
                        Spacer()
                    }
                    HStack{
                        Text(self.taskStore.tasks[self.taskIndex!].priority.rawValue)
                            .font(.footnote)
                            .padding(.leading, 30)
                            .foregroundColor(Color.white)
                    }
                }
                }.padding(18)
        }
       
    }
}

#if DEBUG
struct TaskCell_Previews : PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task(title: "Task Uno", isFinished: false, id: 1)).environmentObject(TaskStore.getInstance()).frame(height: 80)
    }
}
#endif
