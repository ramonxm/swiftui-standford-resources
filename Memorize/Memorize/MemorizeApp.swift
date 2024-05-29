//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ramon Xavier on 27/03/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject var game = EmojiMemorizeGame()
    
    var body: some Scene {
        WindowGroup {
                EmojiMemorizeGameView(viewModel: game)
        }
    }
}
