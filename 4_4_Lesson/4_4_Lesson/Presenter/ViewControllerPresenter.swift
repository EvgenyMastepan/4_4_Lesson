//
//  ViewControllerPresenter.swift
//  4_4_Lesson
//
//  Created by Evgeny Mastepan on 03.10.2025.
//

import Foundation

protocol ViewControllerPresenterProtocol {
    func fetchImages(query: String)
}

class ViewControllerPresenter: ViewControllerPresenterProtocol {
    
    weak var view: ViewControllerProtocol?
    
    init(view: ViewControllerProtocol?) {
        self.view = view
    }
    
    func fetchImages(query: String) {
        //
    }
    
    
}
