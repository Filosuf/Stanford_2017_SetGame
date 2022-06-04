//
//  ViewController.swift
//  SetGame
//
//  Created by 1234 on 19.05.2022.
//

import UIKit

class SetGameViewController: UIViewController {

    var game = SetGame()
    let setGameView = SetGameView()

    override func viewDidLoad() {
        debugPrint(#function)
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        setView()
    }

    private func setView() {
        setGameView.collectionView.delegate = self
        setGameView.collectionView.dataSource = self
        setGameView.newGameButton.addTarget(self, action: #selector(newGameButtonPressed), for: .touchUpInside)
        setGameView.dealCardsButton.addTarget(self, action: #selector(dealCardsButtonPressed), for: .touchUpInside)
    }

    @objc private func newGameButtonPressed() {
        game.startGame()
        setGameView.collectionView.reloadData()
    }

    @objc private func dealCardsButtonPressed() {
        game.dealCard()
        setGameView.collectionView.reloadData()
    }

    private func borderColor(card: Card?) -> CGColor? {
        guard let card = card else { return nil }
        if let _ = game.selectedCards.firstIndex(of: card) {
            if game.selectedCards.count == 3 {
                if game.isSet() {
                    return Constants.setColor
                } else {
                    return Constants.notSetColor
                }
            } else {
                return Constants.selectColor
            }
        }
        return nil
    }

    private func layout() {
        setGameView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(setGameView)

        NSLayoutConstraint.activate([

            setGameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            setGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            setGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            setGameView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension SetGameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        game.cardsOnTable.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as! CardsCollectionViewCell
        let card = game.cardsOnTable[indexPath.item]
        cell.setupCell(card: card)
        cell.setBorder(color: borderColor(card: card))
        return cell
    }

}

//MARK: - UICollectionViewDelegateFlowLayout
extension SetGameViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 10}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - CGFloat(4 + 1) * sideInset) / CGFloat(4)
        return CGSize(width: width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        game.makeOneMove()
        collectionView.reloadData()
//        print("SelectedCards do")
//        for card in game.selectedCards {
//            print(card)
//        }
        game.selectCard(card: game.cardsOnTable[indexPath.item]!)
//        print("posle")
//        for card in game.selectedCards {
//            print(card)
//        }
//        print()
//        print("Card is face down \(game.cardsOnTable[indexPath.item])")
    }

}

