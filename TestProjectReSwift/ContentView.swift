//
//  ContentView.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = TodoViewModel(store: mainStore)
    @StateObject private var routerViewModel = RouterViewModel(routerStore: RouterStore)

    var body: some View {
        NavigationView {
            
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    todoListView
                    Button("Agregar Todo") {
                        let newTodo = TodoItem(id: UUID(), text: "Nuevo Todo", isCompleted: false)
                        viewModel.addTododFromButton(newTodo)
                    }
                }
            }
            .task {
                viewModel.loadExampleItems()
            }
        }
    }

    var todoListView: some View {
            List {
                ForEach(viewModel.todos, id: \.id) { todo in
                    Button(action: {
                        routerViewModel.navigateToDetails(todo: todo)
                    }) {
                        Text(todo.text)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let todo = viewModel.todos[index]
                        viewModel.removeTodo(id: todo.id)
                    }
                }
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: Button(action: { viewModel.addTodo() }) {
                Image(systemName: "plus")
            })
            .background(
                NavigationLink(
                    destination: destinationView(),
                    isActive: .constant(routerViewModel.navigateTo != .todos),
                    label: { EmptyView() } 
                )
            )
    }

    func destinationView() -> some View {
        switch routerViewModel.navigateTo {
        case .todos:
            return AnyView(ContentView())
        case .details:
            return AnyView(DetailsView(navigationState: $routerViewModel.navigateTo))
        }
    }
}



#Preview {
    ContentView()
}
