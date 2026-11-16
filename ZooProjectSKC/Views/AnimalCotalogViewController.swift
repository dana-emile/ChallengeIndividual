//
//  AnimalCotalogViewController.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 13/11/26.
//

import UIKit

class AnimalCatalogViewController: UIViewController {

    // Informações dos Animais

    private let animals: [Animal] = [

        Animal(
            name: "Onça-pintada",
            species: "Mamífero",
            habitat: "Florestas e áreas alagadas",
            diet: "Carnívora",
            socialBehavior: "Solitária",
            imageName: "onca"
        ),

        Animal(
            name: "Arara-azul",
            species: "Ave",
            habitat: "Florestas tropicais",
            diet: "Frutas e sementes",
            socialBehavior: "Vive em pares",
            imageName: "arara"
        ),

        Animal(
            name: "Macaco-prego",
            species: "Mamífero",
            habitat: "Florestas",
            diet: "Onívoro",
            socialBehavior: "Vive em grupos",
            imageName: "macaco"
        ),

        Animal(
            name: "Jacaré",
            species: "Réptil",
            habitat: "Rios e áreas alagadas",
            diet: "Carnívoro",
            socialBehavior: "Solitário",
            imageName: "jacare"
        )
    ]

    // Ajustes

    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()

        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(
            top: 16,
            left: 16,
            bottom: 16,
            right: 16
        )

        return UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
    }()

 // DidLoad - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
    }

// Visualização da célula

    private func setupInterface() {

        title = "Conheça os animais"

        view.backgroundColor = .systemBackground

        collectionView.backgroundColor = .systemBackground

        collectionView.register(
            AnimalCell.self,
            forCellWithReuseIdentifier: AnimalCell.identifier
        )

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),

            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            collectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
}

// Disposição das informações dos animais

extension AnimalCatalogViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        return animals.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AnimalCell.identifier,
            for: indexPath
        ) as! AnimalCell

        let animal = animals[indexPath.item]

        cell.configure(with: animal)

        return cell
    }
}

// Formato do Catálogo

extension AnimalCatalogViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let width = (collectionView.bounds.width - 44) / 2

        return CGSize(width: width, height: 205)
    }
}

