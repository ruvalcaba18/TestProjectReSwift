//
//  TodoMiddleWare.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 31/12/24.
//

import Foundation
import ReSwift
import ReSwiftThunk

public func createAPIClientMiddleware() -> Middleware<AppState> {
    return { dispatch, state in
        return { next in
            return { action in
                // Si la acción es LoadExampleItemsAction, hacemos la llamada a la API
                if action is LoadExampleItemsAction {

                    
                    // Realizamos la llamada a la API de forma asíncrona
                    Task {
            
                        do {
                            try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                            // Aquí se simula una llamada a la API con un JSON estático
                            let json = """
                            [
                                {"id": 1, "name": "Example", "isPresented": false},
                                {"id": 2, "name": "Another Example", "isPresented": true}
                            ]
                            """.data(using: .utf8)!
                            
                            // Decodificamos el JSON recibido
                            let items = try JSONDecoder().decode([ExampleItem].self, from: json)
                            
                            // Despachamos los items cargados
                            dispatch(ExampleItemsLoadedAction(items: items))
                        } catch {
                            // En caso de error, despachamos el error
                            dispatch(ExampleItemsLoadingErrorAction(error: error.localizedDescription))
                        }
                    }
                    return
                }
                
                // Continuamos con la siguiente acción si no es de carga
                return next(action)
            }
        }
    }
}

// Usar un thunk es solamente otra accion
let thunkMiddleware =  Thunk<AppState> { dispatch, state in
        
        
    if let getstate = state() {
        // Realizamos la llamada a la API de forma asíncrona
        Task {

            do {
                try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                // Aquí se simula una llamada a la API con un JSON estático
                let json = """
                [
                    {"id": 1, "name": "Example", "isPresented": false},
                    {"id": 2, "name": "Another Example", "isPresented": true}
                ]
                """.data(using: .utf8)!
                
                // Decodificamos el JSON recibido
                let items = try JSONDecoder().decode([ExampleItem].self, from: json)
                
                // Despachamos los items cargados
                dispatch(ExampleItemsLoadedAction(items: items))
            } catch {
                // En caso de error, despachamos el error
                dispatch(ExampleItemsLoadingErrorAction(error: error.localizedDescription))
            }
        }
        return
    }
    
}
