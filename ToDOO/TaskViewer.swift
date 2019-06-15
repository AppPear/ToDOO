//
//  TaskViewer.swift
//  ToDOO
//
//  Created by András Samu on 2019. 06. 14..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

struct TaskViewer : View {

    var body: some View {
        NavigationView{
            TaskList()
            .navigationBarTitle(Text("Tasks"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#if DEBUG
struct TaskViewer_Previews : PreviewProvider {
    static var previews: some View {
        TaskViewer().environmentObject(TaskStore.getInstance())
    }
}
#endif
