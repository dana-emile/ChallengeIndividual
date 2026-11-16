//
//  AnimalDetailViewController.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 16/11/26.
//


import UIKit

final class AnimalDetailViewController: UIViewController {

    private let animal: Animal

    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    private let animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init(animal: Animal) {
        self.animal = animal
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }

    private func setupInterface() {
        title = animal.name
        view.backgroundColor = .systemBackground

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill

        animalImageView.image = UIImage(named: animal.imageName)

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(animalImageView)

        addInfo(title: "Espécie", value: animal.species)
        addInfo(title: "Habitat", value: animal.habitat)
        addInfo(title: "Alimentação", value: animal.diet)
        addInfo(
            title: "Comportamento social",
            value: animal.socialBehavior
        )

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),

            stackView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor,
                constant: 20
            ),
            stackView.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 20
            ),
            stackView.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -20
            ),
            stackView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -20
            ),

            stackView.widthAnchor.constraint(
                equalTo: scrollView.frameLayoutGuide.widthAnchor,
                constant: -40
            ),

            animalImageView.heightAnchor.constraint(
                equalToConstant: 250
            )
        ])
    }

    private func addInfo(title: String, value: String) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(
            ofSize: 18,
            weight: .semibold
        )

        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .systemFont(ofSize: 16)
        valueLabel.textColor = .secondaryLabel
        valueLabel.numberOfLines = 0

        let infoStack = UIStackView(
            arrangedSubviews: [titleLabel, valueLabel]
        )

        infoStack.axis = .vertical
        infoStack.spacing = 6

        stackView.addArrangedSubview(infoStack)
    }
}
