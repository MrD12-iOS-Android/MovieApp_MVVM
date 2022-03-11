//
//  Coordinator.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func getViewController() -> UIViewController
    func show(present: Bool)
}
