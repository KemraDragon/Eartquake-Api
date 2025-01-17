//
//  LoginViewModel.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    // Variables publicadas que actualizarán la vista automáticamente
    @Published var email = ""
    @Published var password = ""
    @Published var loginSuccess = false
    @Published var errorMessage: String?

    // Referencia al servicio de autenticación
    private var authService = AuthService()
    private var cancellables = Set<AnyCancellable>() // Para almacenar las suscripciones Combine

    // Método para manejar el inicio de sesión
    func login() {
        authService.loginUser(email: email, password: password)
            .receive(on: DispatchQueue.main) // Aseguramos que la respuesta se procese en el hilo principal
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription // Manejamos errores
                }
            } receiveValue: { user in
                if user != nil {
                    self.loginSuccess = true // Marcamos el inicio de sesión como exitoso
                } else {
                    self.errorMessage = "Credenciales inválidas" // Mensaje de error si no coincide
                }
            }
            .store(in: &cancellables) // Almacenamos la suscripción
    }
}
