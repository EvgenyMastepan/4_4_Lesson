//
//  ViewController.swift
//  4_4_Lesson
//
//  Created by Evgeny Mastepan on 02.10.2025.
//

import UIKit
import Kingfisher

protocol ViewControllerProtocol: AnyObject {
    func reloadImage(url: URL?)
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    var presenter: ViewControllerPresenterProtocol?
    
    lazy var titul: UILabel = {
        
        return $0
    }(UILabel())
    
    lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFill
//        $0.kf.setImage(with: URL(string: "https://cdn2.thecatapi.com/images/b70.jpg"))
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5) // Добавлено потому, что бывали проблемы со смещением фото.
        $0.backgroundColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var reloadButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .blue
        $0.setImage(UIImage(systemName: "repeat.circle"), for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: reloadAction))
    
    private lazy var reloadAction = UIAction { _ in
        self.presenter?.fetchImages(query: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraints()
        presenter?.fetchImages(query: "")
    }

    private func setupConstraints() {
        view.addSubview(image)
        view.addSubview(reloadButton)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            image.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            reloadButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            reloadButton.heightAnchor.constraint(equalToConstant: 50),
            reloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            reloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            
        ])
    }
    
    func reloadImage(url: URL?) {
        self.image.kf.setImage(with: url)
    }

}

