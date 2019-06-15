//
//  Task.swift
//  ToDOO
//
//  Created by András Samu on 2019. 06. 14..
//  Copyright © 2019. András Samu. All rights reserved.
//

import Foundation
import SwiftUI
struct Task: Identifiable, Codable {
    var title: String
    var isFinished: Bool
    var dateAdded: Date? = nil
    var id:Int
    
    init(title: String, isFinished: Bool, id:Int, dateAdded: Date? = nil) {
        self.title = title
        self.isFinished = isFinished
        self.id = id
        self.dateAdded = dateAdded
    }
}
