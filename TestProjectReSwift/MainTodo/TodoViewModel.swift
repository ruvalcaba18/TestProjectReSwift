//
//  TodoViewModel.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation
import ReSwift
  
@MainActor final class TodoViewModel: ObservableObject {
    
    @Published var todos: [TodoItem] = []
    @Published var items: [ExampleItem] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil
    
    private var Appstore: Store<AppState>
    
    init(store: Store<AppState>) {
        self.Appstore = store
        Appstore.subscribe(self) { subscription in
            subscription.select { $0}
        }
    }
    
    // Funciones para despachar acciones
    func addTodo() {
        let newTodo = TodoItem(id: UUID(), text: "New Task", isCompleted: false)

        Appstore.dispatch(AddTodoAction(todo: newTodo))
    }
    
    func addTododFromButton(_ todo: TodoItem) {
        Appstore.dispatch(AddTodoAction(todo: todo))
    }
    
    func removeTodo(id: UUID) {
        Appstore.dispatch(RemoveTodoAction(id: id))
    }
    
    func toggleTodo(id: UUID) {
        Appstore.dispatch(ToggleTodoAction(id: id))
    }
    
    func loadExampleItems() {
        Appstore.dispatch(LoadExampleItemsAction())
    }
    
    func loadEXampleItemsWithThunk() {
        Appstore.dispatch(thunkMiddleware)
    }
    
    func unsubscribe(_ viewModel: TodoViewModel) {
        Appstore.unsubscribe(viewModel)
    }
}

extension TodoViewModel: StoreSubscriber {
    
    @MainActor func newState(state: AppState) {
         Task {
             self.todos = state.todos
             self.items = state.items
             self.isLoading = state.isLoading
             self.errorMessage = state.errorMessage
         }
    }
}
