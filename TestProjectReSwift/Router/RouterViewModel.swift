//
//  RouterViewModel.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 20/12/24.
//

import Foundation
import ReSwift

@MainActor final class RouterViewModel: ObservableObject {
    
    private var routerStore: Store<RouteState>
    @Published var navigateTo: RouteDestionation = .todos
    
    init(routerStore: Store<RouteState>) {
        self.routerStore = routerStore
        self.routerStore.subscribe(self) { subscription in
            subscription.select{ $0 }
        }
    }
    
    func navigateToDetails(todo: TodoItem) {
        routerStore.dispatch(NavigateToDetailsAction())
    }
}

extension RouterViewModel: StoreSubscriber {
    typealias StoreSubscriberStateType = RouteState
    
    @MainActor func newState(state: StoreSubscriberStateType) {
        self.navigateTo = state.navigationState
    }
}
