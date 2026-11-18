//
//  ContentView.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 13/11/26.
//



import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ZooNavigationController()
            .ignoresSafeArea()
    }
}

struct ZooNavigationController: UIViewControllerRepresentable {

    // Gerencia o caminho entre as telas.
    
    func makeUIViewController(context: Context) -> UINavigationController {

        let welcome = WelcomeViewController()

        let navigationController = UINavigationController(
            rootViewController: welcome
        )

        return navigationController
    }

    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {}
}
