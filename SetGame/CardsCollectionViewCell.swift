//
//  CardsCollectionViewCell.swift
//  SetGame
//
//  Created by 1234 on 20.05.2022.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {


    private let iconImage: UIImageView = {

        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .systemMint
        image.image = UIImage(systemName: "list.bullet.circle")
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    private let cardLabel: UILabel = {

        let label = UILabel()
        label.text = "★ ◼︎ ▲"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 6
        label.clipsToBounds = true

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .systemGray6
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(card: Card?) {
        if let card = card {
            cardLabel.backgroundColor = Constants.cardFaseUpColor
            //set shape
            let icon = Constants.symbols[card.shape.rawValue - 1]
            //set color
            cardLabel.textColor = Constants.colors[card.color.rawValue - 1]
            //set fill
            //set number
            cardLabel.text = icon
            for _ in 1 ..< card.number.rawValue {
                cardLabel.text! += "\n" + icon
            }
        } else {
            cardLabel.backgroundColor = Constants.cardBackColor
            cardLabel.text = ""

        }
    }

    func setBorder(color: CGColor?) {
        if let color = color {
            cardLabel.layer.borderWidth = 6
            cardLabel.layer.borderColor = color
        } else {
            cardLabel.layer.borderWidth = 0
        }
    }

    private func layout() {
        [cardLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            cardLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
