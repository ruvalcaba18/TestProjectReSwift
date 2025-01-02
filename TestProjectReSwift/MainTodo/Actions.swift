//
//  Actions.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation
import ReSwift

public protocol ActionHandler: Action {
     func handle(state: AppState) -> AppState
}


public struct AddTodoAction: ActionHandler {
    let todo:TodoItem
    
    public func handle(state: AppState) -> AppState {
        var newState = state
        newState.currentView = .todos
        newState.todos.append(todo)
        return newState
    }
}

public struct RemoveTodoAction: ActionHandler {
    let id:UUID
    
    public func handle(state: AppState) -> AppState {
        var newstate = state
        newstate.currentView = .todos
        newstate.todos = newstate.todos.filter{ $0.id != id }
        return newstate
    }
}

public struct ToggleTodoAction: ActionHandler {
    
    let id:UUID
    
    public func handle(state: AppState) -> AppState {
        
        var newState = state
        newState.currentView = .todos
        newState.todos =  newState.todos.map{ newTodo in
            if newTodo.id == id {
                return modifyMatchedId(newTodo)
            }
            return newTodo
        }
        return newState
    }
    
    private func modifyMatchedId(_ matchedTodo: TodoItem) -> TodoItem {
        return TodoItem(id: matchedTodo.id, text: matchedTodo.text, isCompleted: !matchedTodo.isCompleted)
    }
}


struct NavigateToTodosAction: ActionHandler {
    
    func handle(state: AppState) -> AppState {
        var newState = state
        newState.currentView = .todos
        return newState
    }
    
    
}
struct NavigateToDetailsAction: ActionHandler {
    
    func handle(state: AppState) -> AppState {
        var newState = state
        newState.currentView = .details
        return newState
    }
    
}
