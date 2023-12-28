//
//  ThemeViewController.swift
//  proj1
//
//  Created by Nick on 22/12/2023.
//

import UIKit

final class ThemeViewController: UIViewController {
    
    private var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Белая", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = WhiteTheme().backgroundColor
        button.setTitleColor(WhiteTheme().textColor, for: .normal)
        return button
    }()
    
    private var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Тема ВК", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = BlueTheme().backgroundColor
        button.setTitleColor(BlueTheme().textColor, for: .normal)
        return button
    }()
    
    private var button3: UIButton = {
        let button = UIButton()
        button.setTitle("Чёрная", for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = BlackTheme().backgroundColor
        button.setTitleColor(BlackTheme().textColor, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        setupConstraints()
    }
    
    private func setupConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            
            button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -30),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(equalTo: button2.widthAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.widthAnchor.constraint(equalTo: button2.widthAnchor),
        ])
    }
}

private extension ThemeViewController {
    @objc func tap1() {
        Theme.currentTheme = WhiteTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        tabBarController?.tabBar.barTintColor = Theme.currentTheme.backgroundColor
        tabBarController?.tabBar.tintColor = Theme.currentTheme.textColor
    }
    
    @objc func tap2() {
        Theme.currentTheme = BlueTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        tabBarController?.tabBar.barTintColor = Theme.currentTheme.backgroundColor
        tabBarController?.tabBar.tintColor = Theme.currentTheme.textColor
    }
    
    @objc func tap3() {
        Theme.currentTheme = BlackTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.barTintColor = Theme.currentTheme.backgroundColor
        tabBarController?.tabBar.barTintColor = Theme.currentTheme.backgroundColor
        tabBarController?.tabBar.tintColor = Theme.currentTheme.textColor
    }
    
    
}
