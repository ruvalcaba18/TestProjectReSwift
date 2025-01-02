//
//  RouterHandler.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 20/12/24.
//

import Foundation
import ReSwift

protocol RouterHandler: Action {
    func handle(state:RouteState) -> RouteState
}
