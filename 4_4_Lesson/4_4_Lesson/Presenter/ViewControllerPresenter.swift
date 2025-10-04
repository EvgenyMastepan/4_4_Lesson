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
    var network: NetworkProtocol
    
    init(view: ViewControllerProtocol?, network: NetworkProtocol) {
        self.view = view
        self.network = network
    }
    
    func fetchImages(query: String) {
        network.getRandomPhoto(query: query) { [weak self] result in
            switch result {
            case .success(let catImage):
                guard let catImage else { return }
                
                let imageURL = URL(string: catImage.url)
                print("URL: \(imageURL)")
                
                DispatchQueue.main.async {
                    self?.view?.reloadImage(url: imageURL)
                }
            
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
}
