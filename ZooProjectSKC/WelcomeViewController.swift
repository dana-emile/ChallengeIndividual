//
//  WelcomeViewController.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 13/11/26.
//

import UIKit

class WelcomeViewController: UIViewController {

    // Background do Figma

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "welcome-background")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // Camada escura para melhorar a leitura dos textos
    private let overlayView: UIView = {
        let overlay = UIView()

        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.38)
        overlay.translatesAutoresizingMaskIntoConstraints = false

        return overlay
    }()

    // Textos

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "Bem-Vindo(a) ao Zoológico!"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()

        label.text = "Acompanhe de forma digital os animais"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    // Botão [COMPARAR COM SWIFT]

    private let enterButton: UIButton = {
        var configuration = UIButton.Configuration.filled()

        configuration.title = "Explorar animais"
        configuration.baseBackgroundColor = UIColor(
            red: 0.75,
            green: 0.82,
            blue: 0.62,
            alpha: 1
        )
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .large

        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    //  Ciclo de vida [ENTENDER]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
        setupAnimations()
    }

    // Ajustes da interface

    private func setupInterface() {

        view.backgroundColor = .black

        // Adicionando o fundo primeiro
        view.addSubview(backgroundImageView)
        view.addSubview(overlayView)

        // Adicionando os elementos da interface
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(enterButton)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            // Background
            backgroundImageView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),

            backgroundImageView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),

            backgroundImageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            backgroundImageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            // Overlay
            overlayView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),

            overlayView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),

            overlayView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            overlayView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            // Título
            titleLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            titleLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -90
            ),

            titleLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: view.leadingAnchor,
                constant: 24
            ),

            titleLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: view.trailingAnchor,
                constant: -24
            ),

            // Subtítulo
            subtitleLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 16
            ),

            subtitleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 32
            ),

            subtitleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -32
            ),

            // Botão
            enterButton.topAnchor.constraint(
                equalTo: subtitleLabel.bottomAnchor,
                constant: 36
            ),

            enterButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            enterButton.widthAnchor.constraint(
                equalToConstant: 220
            ),

            enterButton.heightAnchor.constraint(
                equalToConstant: 54
            )
        ])

        enterButton.addTarget(
            self,
            action: #selector(enterCatalog),
            for: .touchUpInside
        )
    }

    // Animações

    private func setupAnimations() {

        titleLabel.alpha = 0
        subtitleLabel.alpha = 0
        enterButton.alpha = 0

        UIView.animate(
            withDuration: 1.2,
            delay: 0.2,
            options: .curveEaseOut
        ) {
            self.titleLabel.alpha = 1
        }

        UIView.animate(
            withDuration: 1.2,
            delay: 0.7,
            options: .curveEaseOut
        ) {
            self.subtitleLabel.alpha = 1
        }

        UIView.animate(
            withDuration: 1.2,
            delay: 1.1,
            options: .curveEaseOut
        ) {
            self.enterButton.alpha = 1
        }
    }

    // Navegação

    @objc private func enterCatalog() {

        let catalog = AnimalCatalogViewController()

        navigationController?.pushViewController(
            catalog,
            animated: true
        )
    }
}
