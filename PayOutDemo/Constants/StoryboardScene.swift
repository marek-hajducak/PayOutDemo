//
//  StoryboardScene.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Storyboard Scenes

internal enum StoryboardScene {
    internal enum Main: StoryboardType {
        internal static let storyboardName = "Main"
        internal static let initialScene = InitialSceneType<MainViewController>(storyboard: Main.self)
    }
    
    internal enum AppTabBar: StoryboardType {
        internal static let storyboardName = "AppTabBar"
        internal static let initialScene = InitialSceneType<AppTabBarController>(storyboard: AppTabBar.self)
    }
    
    internal enum Transaction: StoryboardType {
        internal static let storyboardName = "Transaction"
        internal static let initialScene = InitialSceneType<TransactionViewController>(storyboard: Transaction.self)
    }
}

// MARK: - Implementation Details

internal protocol StoryboardType {
    static var storyboardName: String { get }
}

internal extension StoryboardType {
    static var storyboard: UIStoryboard {
        let name = self.storyboardName
        return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
    }
}

internal struct SceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal let identifier: String
    
    internal func instantiate() -> T {
        let identifier = self.identifier
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
}

internal struct InitialSceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    
    internal func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
}

private final class BundleToken {}
