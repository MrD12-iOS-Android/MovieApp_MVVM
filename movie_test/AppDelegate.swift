//
//  AppDelegate.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var nowPlayingCoordinator: NowPlayingCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        nowPlayingCoordinator = NowPlayingCoordinator(navigationController: UINavigationController())
        nowPlayingCoordinator?.show()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nowPlayingCoordinator?.navigationController
        window?.makeKeyAndVisible()
        return true
    }

   

}

