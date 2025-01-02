//
//  RoutingReducer.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 19/12/24.
//

import Foundation
import ReSwift

public func routingReducer(action: Action, routerState:RouteState?) -> RouteState{
    
    var state =  routerState ?? RouteState()
    
    if let action = action as? RouterHandler {
        state = action.handle(state: state)
    }
    return state
}
