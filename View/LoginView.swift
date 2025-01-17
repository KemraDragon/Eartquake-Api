//
//  LoginView.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) { // Contenedor principal
            // Campo de texto para el email
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            // Campo de texto para la contraseña
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Mostrar mensaje de error si existe
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            // Botón de inicio de sesión
            Button("Login") {
                viewModel.login()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Enlace a la pantalla de registro
            NavigationLink(destination: RegisterView()) {
                Text("¿No tienes una cuenta? Regístrate aquí")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .navigationTitle("Login") // Título de la pantalla
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
