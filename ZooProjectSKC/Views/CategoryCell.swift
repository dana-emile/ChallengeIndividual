//
//  CategoryCell.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 16/11/26.
//

import UIKit

final class CategoryCell: UICollectionViewCell {

    static let identifier = "CategoryCell"

    private let categoryImageView = UIImageView()
    private let nameLabel = UILabel()

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

        // Configuração da imagem
        categoryImageView.contentMode = .scaleAspectFill
        categoryImageView.clipsToBounds = true

        // Configuração do título
        nameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 1

        [categoryImageView, nameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([

            categoryImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),

            categoryImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),

            categoryImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),

            categoryImageView.heightAnchor.constraint(
                equalToConstant: 140
            ),

            nameLabel.topAnchor.constraint(
                equalTo: categoryImageView.bottomAnchor,
                constant: 12
            ),

            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 8
            ),

            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -8
            )

        ])
    }

    func configure(with category: AnimalCategory) {

        nameLabel.text = category.name

        categoryImageView.image = UIImage(
            named: category.imageName
        )
    }
}

