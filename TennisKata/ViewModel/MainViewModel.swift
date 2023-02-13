//
//  MainViewModel.swift
//  TennisKata
//
//  Created by mac on 13/02/23.
//

import Foundation
import Combine

protocol PlayerAction {
    func playerOneScores()
    func playerTwoScores()
}

final class MainHomeViewModel : ObservableObject {
    
    @Published private(set) var scoreMessage: String?
    var game : Tennis
    //MARK: - Initilizer
    init(playerOneName: String, playerTwoName: String) {
        self.game  = Tennis(playerOneName: playerOneName, playerTwoName: playerTwoName)
    }
    init(game: Tennis) {
        self.game  = game
    }
}

extension MainHomeViewModel: PlayerAction {
    public func playerOneScores() {
        game.playerOneScores()
    }
    
    public func playerTwoScores() {
        game.playerTwoScores()
    }
}
