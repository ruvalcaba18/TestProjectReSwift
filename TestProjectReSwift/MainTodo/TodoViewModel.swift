//
//  TodoViewModel.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation
import ReSwift

final class TodoViewModel: ObservableObject {
    
    @Published var todos: [TodoItem] = []
    @Published var currentView: NavigationStuff = .todos
    
    private var store: Store<AppState>
    
    init(store: Store<AppState>) {
        self.store = store
        store.subscribe(self) { subscription in
            subscription.select { $0 }
        }
    }
    
    // Funciones para despachar acciones
    func addTodo() {
        let newTodo = TodoItem(id: UUID(), text: "New Task", isCompleted: false)

        store.dispatch(AddTodoAction(todo: newTodo))
    }
    
    func removeTodo(id: UUID) {
        store.dispatch(RemoveTodoAction(id: id))
    }
    
    func toggleTodo(id: UUID) {
        store.dispatch(ToggleTodoAction(id: id))
    }
    
    func unsubscribe(_ viewModel: TodoViewModel) {
        store.unsubscribe(viewModel)
    }
    func navigateToDetails(todo: TodoItem) {
        store.dispatch(NavigateToDetailsAction())
    }
}

extension TodoViewModel: StoreSubscriber {
    
    typealias StoreSubscriberStateType = AppState
    
    func newState(state: StoreSubscriberStateType) {
        self.todos = state.todos
        self.currentView = state.currentView
    }
    
}
