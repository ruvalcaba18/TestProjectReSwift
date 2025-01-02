//
//  ThunkExample.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 02/01/25.
//

import Foundation
import ReSwift
import ReSwiftThunk

// Definir la acción Thunk
struct LoadExampleItemsThunk: Action {
    let body: (_ dispatch: @escaping DispatchFunction, _ getState: @escaping () -> AppState?) -> Void
    
    // Inicializador
    init() {
        self.body = { dispatch, getState in
            // Aquí realizamos la llamada a la API de forma asíncrona
            Task {
                do {
                    // Simulamos un retardo de 3 segundos
                    try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                    
                    // Simulamos la respuesta de la API
                    let json = """
                    [
                        {"id": 1, "name": "Example", "isPresented": false},
                        {"id": 2, "name": "Another Example", "isPresented": true}
                    ]
                    """.data(using: .utf8)!
                    
                    // Decodificamos el JSON
                    let items = try JSONDecoder().decode([ExampleItem].self, from: json)
                    
                    // Despachamos la acción de carga exitosa
                    dispatch(ExampleItemsLoadedAction(items: items))
                } catch {
                    // Despachamos la acción de error
                    dispatch(ExampleItemsLoadingErrorAction(error: error.localizedDescription))
                }
            }
        }
    }
}
