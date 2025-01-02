//
//  AppState.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation

public struct TodoItem {
    var id:UUID
    var text:String
    let isCompleted: Bool
}

public struct AppState {
    var todos : [TodoItem] = [ ]
    var items: [ExampleItem] = []
    var errorMessage: String? = nil
    var isLoading: Bool = true
}

