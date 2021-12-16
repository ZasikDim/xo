//
//  MarkInvoker.swift
//  XO-game
//
//  Created by Dmitry Zasenko on 15.12.21.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

final class MarkInvoker {
    
    static let shared = MarkInvoker()
    
    private let batchSize = 5

    private var commands: [MarkCommand] = []

    func addMarkCommand(_ command: MarkCommand) {
        self.commands.append(command)
        self.executeCommandsIfNeeded()
    }
    
    private func executeCommandsIfNeeded() {
        guard self.commands.count >= batchSize else { return }
        self.commands.forEach { $0.execute() }
        self.commands = []
    }
}
