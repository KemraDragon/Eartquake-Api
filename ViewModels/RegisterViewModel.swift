//
//  RegisterViewModel.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    // Variables publicadas para enlazar con la vista
    @Published var email = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var registrationSuccess = false
    @Published var errorMessage: String?

    private var authService = AuthService() // Servicio de autenticación
    private var cancellables = Set<AnyCancellable>()

    func register() {
        // Validación básica de contraseñas
        guard password == confirmPassword else {
            errorMessage = "Las contraseñas no coinciden"
            return
        }

        // Crear el objeto User y llamar al servicio
        let user = User(email: email, firstName: firstName, lastName: lastName, password: password)
        authService.registerUser(user: user)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { success in
                self.registrationSuccess = success
                if success {
                    self.errorMessage = nil
                } else {
                    self.errorMessage = "Registro fallido"
                }
            }
            .store(in: &cancellables)
    }
}
