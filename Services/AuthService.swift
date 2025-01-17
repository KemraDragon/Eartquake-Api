//
//  AuthService.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import Foundation
import Combine

class AuthService {
    private var registeredUsers = [User]() // Array para almacenar usuarios registrados

    // Método para registrar un nuevo usuario
    func registerUser(user: User) -> AnyPublisher<Bool, Error> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) { // Simulación de tiempo de espera
                self.registeredUsers.append(user) // Añadimos el usuario al array
                promise(.success(true)) // Devolvemos éxito
            }
        }.eraseToAnyPublisher()
    }

    // Método para iniciar sesión
    func loginUser(email: String, password: String) -> AnyPublisher<User?, Error> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) { // Simulación de tiempo de espera
                let user = self.registeredUsers.first { $0.email == email && $0.password == password }
                promise(.success(user)) // Devolvemos el usuario si coincide
            }
        }.eraseToAnyPublisher()
    }
}
