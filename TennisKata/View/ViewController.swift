//
//  ViewController.swift
//  TennisKata
//
//  Created by mac on 13/02/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    ///@IBOutlet
    @IBOutlet weak var scoreLabel : UILabel!
    
    ///View Model
    private var viewModel : MainHomeViewModel! = nil
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViewModel()
    }

    // MARK: - IBAction
    @IBAction func firstPlayerScores(_ sender: Any) {
        if !self.isGameEnded() {
            viewModel.firstPlayerScores()
        }
    }
    
    @IBAction func secondPlayerScorers(_ sender: Any) {
        if !self.isGameEnded() {
            viewModel.secondPlayerScores()
        }
    }
    
    // MARK: - Helper functions
    
    private func isGameEnded() -> Bool {
        if viewModel.gameState == .ended {
            let alert =  UIAlertController(title: "Game Ended", message: "Do you want to start again?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Start again", style: .default, handler: { _ in
                self.startAgain()
            }))
            self.present(alert, animated: true, completion: nil)
            return true
        }
        return false
    }
    
    private func startAgain() {
        viewModel.startGame()
    }
    
    private func showWinnerAlert() {
        let alert =  UIAlertController(title: "Alert", message: viewModel.scoreMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    ///Set Up ViewModel
    func setUpViewModel() {
        viewModel = MainHomeViewModel(firstPlayerName: "Player 1", secondPlayerName: "Player 2")
        viewModel.$scoreMessage.receive(on: DispatchQueue.main).sink { [weak self] message in
            self?.scoreLabel.text = message
        }.store(in: &bindings)
        
        viewModel.$gameState.receive(on: DispatchQueue.main).sink { [weak self] state in
            if state == .ended {
                self?.showWinnerAlert()
            }
        }.store(in: &bindings)
        
        viewModel.startGame()
    }
}

