//
//  MarkCommand.swift
//  XO-game
//
//  Created by Dmitry Zasenko on 15.12.21.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

final class MarkCommand {
    
    let player: Player
    let position: GameboardPosition
    let gameboard: Gameboard?
    let gameboardView: GameboardView?
    let markViewPrototype: MarkView
    
    init(player: Player, position: GameboardPosition, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        self.position = position
        self.gameboard = gameboard
        self.gameboardView = gameboardView
        self.markViewPrototype = player.markViewPrototype
    }
    
    func execute() {
        Log(.playerInput(player: self.player, position: position))
        guard let gameboardView = self.gameboardView,
              gameboardView.canPlaceMarkView(at: position) else { return }
        gameboard?.setPlayer(self.player, at: position)
        gameboardView.placeMarkView(self.markViewPrototype.copy(), at: position)
    }
    
}
