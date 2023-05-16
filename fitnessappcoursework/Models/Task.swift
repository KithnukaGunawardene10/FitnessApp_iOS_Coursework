//
//  Task.swift
//  iOS_Project
//
//  Created by K.M.Kithnuka Gunawardene on 2023-03-23.
//

import Foundation



struct TaskType{
    
    let symbolName: String
    let typeName: String
}


struct Task{
    var taskname: String
    var taskDescription: String
    var sceonds: Int
    var tasktype: TaskType
    
    var timestamp: Double
    
}

enum CountdownState{
    case suspended
    case running
    case paused
}
