//
//  ErrorHandler2.swift
//  Eartquake-Api
//
//  Created by Kevin  on 17-01-25.
//

import Foundation

struct ErrorHandler2 {
    static func handle(error: Error) -> String {
        // Manejo de errores de red
        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                return "No estás conectado a Internet. Por favor, verifica tu conexión."
            case .timedOut:
                return "La solicitud tardó demasiado tiempo. Intenta nuevamente."
            default:
                return "Error de red: (urlError.localizedDescription)"
            }
        }

        // Manejo de errores de decodificación
        if let decodingError = error as? DecodingError {
            switch decodingError {
            case .typeMismatch:
                return "Se recibió un tipo de datos inesperado."
            case .valueNotFound:
                return "Faltan valores en la respuesta."
            case .keyNotFound:
                return "Faltan claves en la respuesta."
            case .dataCorrupted:
                return "Los datos están corruptos o incompletos."
            @unknown default:
                return "Error al procesar los datos. Intenta nuevamente."
            }
        }

        // Mensaje genérico para otros errores
        return "Ocurrió un error inesperado: (error.localizedDescription)"
    }
}
