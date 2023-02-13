//
//  Tennis.swift
//  TennisKata
//
//  Created by mac on 13/02/23.
//

import Foundation

public class Tennis {
    
    private var firstPlayer : Player
    private var secondPlayer : Player
    
    init(firstPlayerName: String, secondPlayerName: String) {
        firstPlayer = Player(name: firstPlayerName)
        secondPlayer = Player(name: secondPlayerName)
    }
    
    public func  getScore() -> String {
        
        if (gameHasWinner()) {
            return leadingScorer() + " wins"
        }
        
        if (scoreAtAdvantage()) {
            return leadingScorer() + " on Advantage"
        }
        
        if (isGameOnDeuce()) {
            return "Deuce"
        }
        
        if(firstPlayer.score == secondPlayer.score) {
            return getScoreString(firstPlayer.score) + " all"
        }
        
        return getScoreString(firstPlayer.score) + "," + getScoreString(secondPlayer.score);
    }
    
    
    private func isGameOnDeuce() -> Bool {
        return firstPlayer.score >= 3 && secondPlayer.score == firstPlayer.score;
    }
    
    private func  leadingScorer() -> String {
        if (firstPlayer.score > secondPlayer.score) {
            return firstPlayer.name
        } else {
            return secondPlayer.name
        }
    }
    
    private func gameHasWinner() -> Bool {
        if(secondPlayer.score >= 4 && secondPlayer.score >= firstPlayer.score + 2 ) {
            return true
        }
        if(firstPlayer.score >= 4 && firstPlayer.score >= secondPlayer.score + 2) {
            return true
        }
        return false;
    }
    
    private func scoreAtAdvantage() -> Bool {
        if (secondPlayer.score >= 4 && secondPlayer.score == firstPlayer.score + 1) {
            return true
        }
        if (firstPlayer.score >= 4 && firstPlayer.score == secondPlayer.score + 1) {
            return true;
        }
        return false;
    }
    
    public func firstPlayerScores() {
        firstPlayer.updateScore()
    }
    
    public func secondPlayerScores() {
        secondPlayer.updateScore()
    }
    
    private func getScoreString(_ score: Int) -> String {
        switch (score) {
        case 3:
            return "40";
        case 2:
            return "30";
        case 1:
            return "15";
        case 0:
            return "Love";
        default:
            NSException(name: NSExceptionName.invalidArgumentException, reason: "Illegal score: \(score)" , userInfo: nil).raise()
        }
        return ""
    }
}
