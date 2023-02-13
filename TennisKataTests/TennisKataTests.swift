//
//  TennisKataTests.swift
//  TennisKataTests
//
//  Created by mac on 13/02/23.
//

import XCTest
@testable import TennisKata

class TennisKataTests: XCTestCase {
    
    var viewModel : MainHomeViewModel!
    
    override func setUp() {
        super.setUp()
        let game = Tennis(firstPlayerName: "Player 1", secondPlayerName: "Player 2")
        viewModel = MainHomeViewModel(game: game)
        viewModel.startGame()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewGameShouldReturnLoveAll() throws {
        let score : String  = viewModel.getScore()
        XCTAssertEqual("Love all",score)
    }
    
    func testFirstPlayerScoreFirst() throws {
        viewModel.firstPlayerScores()
        let score = viewModel.getScore()
        XCTAssertEqual("15,Love", score)
    }
    
    func testSecondPlayerScoreAfterFirstPlayer() throws {
        viewModel.firstPlayerScores()
        var score = viewModel.getScore()
        XCTAssertEqual("15,Love", score)
        viewModel.secondPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("15 all", score)
    }
    
    func testFirstPlayerWinFirstTwoBalls() throws {
        createScore(2, 0)
        let score = viewModel.getScore()
        XCTAssertEqual("30,Love", score)
    }
    
    func testFirstPlayerFirstThreeBalls() throws {
        viewModel.firstPlayerScores()
        var score = viewModel.getScore()
        XCTAssertEqual("15,Love", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("30,Love", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("40,Love", score)
    }
    
    func testBothAreOnThirty() throws {
        createScore(2, 2)
        let score = viewModel.getScore()
        XCTAssertEqual("30 all", score)
    }
    
    func testPlayesOnDeuce() throws {
        createScore(3, 3)
        let score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
    }
    
    func testFirstPlayerWins() throws {
        createScore(4, 0)
        viewModel.firstPlayerScores()
        viewModel.firstPlayerScores()
        viewModel.firstPlayerScores()
        viewModel.firstPlayerScores()
        let score = viewModel.getScore()
        XCTAssertEqual("Player 1 wins", score)
    }
    
    func testSecondPlayerWins() throws {
        createScore(1, 4)
        let score = viewModel.getScore()
        XCTAssertEqual("Player 2 wins", score)
    }
    
    func testPlayersOnDeuceAgain() throws {
        createScore(3, 3)
        var score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 1 on Advantage", score)
        viewModel.secondPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
    }
    
    func testSecondPlayerWinsAfterAdvantage() {
        createScore(3, 3)
        var score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 1 on Advantage", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 1 wins", score)
    }
    
    func testFirstPlayerWinsAfterAdvantage() {
        createScore(3, 3)
        var score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 1 on Advantage", score)
        viewModel.secondPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
        viewModel.secondPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 2 on Advantage", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Deuce", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 1 on Advantage", score)
        viewModel.firstPlayerScores()
        score = viewModel.getScore()
        XCTAssertEqual("Player 1 wins", score)
    }
    
    private func  createScore(_ p1Balls : Int, _ p2Balls : Int) {
        for _ in  0..<p1Balls {
            viewModel.firstPlayerScores()
        }
        for _ in  0..<p2Balls {
            viewModel.secondPlayerScores()
        }
    }
}
