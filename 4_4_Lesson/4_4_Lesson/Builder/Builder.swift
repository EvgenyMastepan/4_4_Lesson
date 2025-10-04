//
//  Builder.swift
//  4_4_Lesson
//
//  Created by Evgeny Mastepan on 04.10.2025.
//

import UIKit

class Builder {
    static func buildMainView() -> UIViewController {
        let view = ViewController()
        let network = Network()
        let presenter = ViewControllerPresenter(view: view, network: network)
        
        view.presenter = presenter
        
        return view
    }
}
