//
//  TennisKataTests.swift
//  TennisKataTests
//
//  Created by mac on 13/02/23.
//

import XCTest
@testable import TennisKata

class TennisKataTests: XCTestCase {
    
    var game = Tennis(firstPlayerName: "Player 1", secondPlayerName: "Player 2")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewGameShouldReturnLoveAll() throws {
        let score : String  = game.getScore()
        XCTAssertEqual("Love all",score)
    }
    
    func testFirstPlayerScoreFirst() throws {
        game.firstPlayerScores()
        let score = game.getScore()
        XCTAssertEqual("15,Love", score)
    }
    
    func testSecondPlayerScoreAfterFirstPlayer() throws {
        game.firstPlayerScores()
        var score = game.getScore()
        XCTAssertEqual("15,Love", score)
        game.secondPlayerScores()
        score = game.getScore()
        XCTAssertEqual("15 all", score)
    }
    
    func testFirstPlayerWinFirstTwoBalls() throws {
        game.firstPlayerScores()
        game.firstPlayerScores()
        let score = game.getScore()
        XCTAssertEqual("30,Love", score)
    }
    
    func testFirstPlayerFirstThreeBalls() throws {
        game.firstPlayerScores()
        var score = game.getScore()
        XCTAssertEqual("15,Love", score)
        game.firstPlayerScores()
        score = game.getScore()
        XCTAssertEqual("30,Love", score)
        game.firstPlayerScores()
        score = game.getScore()
        XCTAssertEqual("40,Love", score)
    }
    
    func testBothAreOnThirty() throws {
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        let score = game.getScore()
        XCTAssertEqual("30 all", score)
    }
    
    func testPlayesOnDeuce() throws {
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        let score = game.getScore()
        XCTAssertEqual("Deuce", score)
    }
    
    func testFirstPlayerWins() throws {
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        let score = game.getScore()
        XCTAssertEqual("Player 1 wins", score)
    }
    
    func testSecondPlayerWins() throws {
        game.firstPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        let score = game.getScore()
        XCTAssertEqual("Player 2 wins", score)
    }
    
    func testPlayesOnDeuceAgain() throws {
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        var score = game.getScore()
        XCTAssertEqual("Deuce", score)
        game.firstPlayerScores()
        score = game.getScore()
        XCTAssertEqual("Player 1 on Advantage", score)
        game.secondPlayerScores()
        score = game.getScore()
        XCTAssertEqual("Deuce", score)
    }
    
    func testSecondPlayerWinsAfterAdvantage() {
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        
        let score = game.getScore();
        XCTAssertEqual("Player 1 wins", score)
    }
       
    func testFirstPlayerWinsAfterAdvantage() {
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        game.firstPlayerScores()
        
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        game.secondPlayerScores()
        
        let score = game.getScore();
        XCTAssertEqual("Player 1 wins", score)
    }
}
