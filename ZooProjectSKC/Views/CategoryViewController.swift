//
//  CategoryViewController.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 16/11/26.
//

import UIKit

final class CategoryViewController: UIViewController {

    private let category: AnimalCategory
    private let animals: [Animal]

    private var filteredAnimals: [Animal] {
        animals.filter { animal in
            animal.species == category.species
        }
    }

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

    init(category: AnimalCategory, animals: [Animal]) {
        self.category = category
        self.animals = animals

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
        title = category.name
        view.backgroundColor = .systemBackground

        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(
            AnimalCell.self,
            forCellWithReuseIdentifier: AnimalCell.identifier
        )

        collectionView.dataSource = self
        collectionView.delegate = self

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

// Dados dos animais

extension CategoryViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return filteredAnimals.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AnimalCell.identifier,
            for: indexPath
        ) as! AnimalCell

        let animal = filteredAnimals[indexPath.item]
        cell.configure(with: animal)

        return cell
    }
}

// Interação e layout

extension CategoryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let width = (collectionView.bounds.width - 44) / 2

        return CGSize(width: width, height: 205)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let selectedAnimal = filteredAnimals[indexPath.item]

        let detailScreen = AnimalDetailViewController(
            animal: selectedAnimal
        )

        navigationController?.pushViewController(
            detailScreen,
            animated: true
        )
    }
}

