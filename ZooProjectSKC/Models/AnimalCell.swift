//
//  AnimalCell.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 13/11/26.
//

import UIKit

class AnimalCell: UICollectionViewCell {

    static let identifier = "AnimalCell"

    private let animalImageView = UIImageView()
    private let nameLabel = UILabel()
    private let speciesLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {

        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true

        animalImageView.contentMode = .scaleAspectFill
        animalImageView.clipsToBounds = true

        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.numberOfLines = 1

        speciesLabel.font = .systemFont(ofSize: 13)
        speciesLabel.textColor = .secondaryLabel

        [animalImageView, nameLabel, speciesLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([

            animalImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),

            animalImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),

            animalImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),

            animalImageView.heightAnchor.constraint(equalToConstant: 130),

            nameLabel.topAnchor.constraint(
                equalTo: animalImageView.bottomAnchor,
                constant: 10
            ),

            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),

            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),

            speciesLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 4
            ),

            speciesLabel.leadingAnchor.constraint(
                equalTo: nameLabel.leadingAnchor
            ),

            speciesLabel.trailingAnchor.constraint(
                equalTo: nameLabel.trailingAnchor
            )
        ])
    }

    func configure(with animal: Animal) {
        nameLabel.text = animal.name
        speciesLabel.text = animal.species
        animalImageView.image = UIImage(named: animal.imageName)
    }
}

