//
//  ViewController.swift
//  4_4_Lesson
//
//  Created by Evgeny Mastepan on 02.10.2025.
//

import UIKit
//import SDWebImage
import Kingfisher

protocol ViewControllerProtocol: AnyObject {
    func reloadImage(url: URL?)
}

class ViewController: UIViewController {
    
    lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.kf.setImage(with: URL(string: "https://cdn2.thecatapi.com/images/b70.jpg"))
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5) // Добавлено потому, что бывали проблемы со смещением фото.
        $0.backgroundColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            image.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
        ])
    }

}

