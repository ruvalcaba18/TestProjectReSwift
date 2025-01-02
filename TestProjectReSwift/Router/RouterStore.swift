//
//  RouterStore.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 20/12/24.
//

import Foundation
import ReSwift

public let RouterStore = Store( reducer: routingReducer , state: RouteState() , middleware: [])
