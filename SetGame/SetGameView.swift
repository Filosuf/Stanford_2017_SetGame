//
//  SetGameUIView.swift
//  SetGame
//
//  Created by 1234 on 20.05.2022.
//

import UIKit

class SetGameView: UIView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Constants.tableBackgroundColor
        collectionView.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: CardsCollectionViewCell.identifier)
        return collectionView
    }()

    let newGameButton: UIButton = {

        let button = UIButton()
        button.setTitle("New game", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let dealCardsButton: UIButton = {

        let button = UIButton()
        button.setTitle("Deal cards", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [collectionView, newGameButton, dealCardsButton].forEach { self.addSubview($0) }

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: newGameButton.topAnchor, constant: -16),

            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newGameButton.heightAnchor.constraint(equalToConstant: 50),
            newGameButton.widthAnchor.constraint(equalToConstant: 115),
            newGameButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            dealCardsButton.topAnchor.constraint(equalTo: newGameButton.topAnchor),
            dealCardsButton.heightAnchor.constraint(equalTo: newGameButton.heightAnchor),
            dealCardsButton.widthAnchor.constraint(equalTo: newGameButton.widthAnchor),
            dealCardsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
