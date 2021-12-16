//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Stanislav Belykh on 09.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

public class PlayerInputState: GameState {

	public private(set) var isCompleted = false

	public let player: Player
	private(set) weak var gameViewController: GameViewController?
	private(set) weak var gameboard: Gameboard?
	private(set) weak var gameboardView: GameboardView?

	init(player: Player, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
		self.player = player
		self.gameViewController = gameViewController
		self.gameboard = gameboard
		self.gameboardView = gameboardView
	}

	public func begin() {
		switch self.player {
		case .first:
			self.gameViewController?.firstPlayerTurnLabel.isHidden = false
			self.gameViewController?.secondPlayerTurnLabel.isHidden = true
		case .second:
			self.gameViewController?.firstPlayerTurnLabel.isHidden = true
			self.gameViewController?.secondPlayerTurnLabel.isHidden = false
		}
		self.gameViewController?.winnerLabel.isHidden = true
	}
    
    public func addMark(at position: GameboardPosition) {
        guard let gameboard = self.gameboard,
              let gameboardView = self.gameboardView else {return}
        gameboardView.markInvoker.addMarkCommand(MarkCommand(player: player,
                                               position: position,
                                               gameboard: gameboard,
                                               gameboardView: gameboardView))
        Log(.playerInput(player: player, position: position))
        self.isCompleted = true
    }
}
