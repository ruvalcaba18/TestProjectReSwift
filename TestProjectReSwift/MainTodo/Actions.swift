//
//  Actions.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation
import ReSwift

// Acción para iniciar la carga de los datos
struct LoadExampleItemsAction: ActionHandler {
    
    func handle(state: AppState) -> AppState {
        var newState = state
        newState.isLoading = true
        newState.errorMessage = ""
        return newState
    }
}

// Acción para actualizar el estado con los datos cargados
struct ExampleItemsLoadedAction: ActionHandler {
    
    let items: [ExampleItem]
    
    func handle(state: AppState) -> AppState {
        var newState = state
        newState.items = items
        newState.isLoading = false
        print("items loaded -> ",items)
        return newState
    }
}

// Acción para manejar errores al cargar los datos
struct ExampleItemsLoadingErrorAction: ActionHandler {
    
    let error: String
    func handle(state: AppState) -> AppState {
        var newState = state
        newState.errorMessage = error
        newState.isLoading = false
        return newState
    }
}


public struct AddTodoAction: ActionHandler {
    public typealias StateType = AppState
    let todo:TodoItem
    
    public func handle(state: StateType) -> StateType {
        var newState = state
        newState.todos.append(todo)
        return newState
    }
}

public struct RemoveTodoAction: ActionHandler {
    public typealias StateType = AppState
    let id:UUID
    
    public func handle(state: StateType) -> StateType {
        var newstate = state
        newstate.todos = newstate.todos.filter{ $0.id != id }
        return newstate
    }
}

public struct ToggleTodoAction: ActionHandler {
    public typealias StateType = AppState
    let id:UUID
    
    public func handle(state: StateType) -> StateType {
        
        var newState = state
        
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


struct NavigateToTodosAction: RouterHandler {
    
    func handle(state: RouteState) -> RouteState {
        var state = state
        state.navigationState = .todos
        return state
    }
     
}

struct NavigateToDetailsAction: RouterHandler {
    
    func handle(state: RouteState) -> RouteState {
        var state = state
        state.navigationState = .details
        return state
    }
    
}
