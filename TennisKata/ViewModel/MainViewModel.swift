//
//  MainViewModel.swift
//  TennisKata
//
//  Created by mac on 13/02/23.
//

import Foundation
import Combine

protocol PlayerAction {
    func firstPlayerScores()
    func secondPlayerScores()
    func startGame()
    func getScore() -> String
}

final class MainHomeViewModel : ObservableObject {
    
    @Published private(set) var scoreMessage: String?
    @Published private(set) var gameState: GameState = .notStarted
    var game : Tennis
    //MARK: - Initilizer
    init(firstPlayerName: String, secondPlayerName: String) {
        self.game  = Tennis(firstPlayerName: firstPlayerName, secondPlayerName: secondPlayerName)
    }
    init(game: Tennis) {
        self.game  = game
    }
}

extension MainHomeViewModel: PlayerAction {
    func firstPlayerScores() {
        game.firstPlayerScores()
        scoreMessage = game.getScore()
        gameState = game.gameState
    }
    
    func secondPlayerScores() {
        game.secondPlayerScores()
        scoreMessage = game.getScore()
        gameState = game.gameState
    }
    
    func startGame() {
        game.resetGame()
        scoreMessage = game.getScore()
        gameState = game.gameState
    }
    
    func getScore() -> String {
        return self.scoreMessage ?? ""
    }
}
