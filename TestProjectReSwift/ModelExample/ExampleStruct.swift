//
//  ExampleStruct.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 02/01/25.
//

import Foundation

struct ExampleItem: Identifiable, Codable{
    let id: Int
    let name: String
    let isPresented: Bool
}
