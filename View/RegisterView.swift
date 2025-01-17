//
//  RegisterView.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import Foundation
import SwiftUI
struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()

    var body: some View {
        VStack(spacing: 20) {
            // Campos de entrada para los datos del usuario
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            TextField("Nombre", text: $viewModel.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Apellido", text: $viewModel.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirmar Contraseña", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Mostrar mensaje de error si existe
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            // Botón de registro
            Button("Registrar") {
                viewModel.register()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Navegación condicional si el registro es exitoso
            NavigationLink(
                destination: Text("Pantalla Principal"), // Cambia por la vista principal
                isActive: $viewModel.registrationSuccess
            ) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Registro")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
