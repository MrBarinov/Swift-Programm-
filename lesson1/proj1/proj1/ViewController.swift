//
//  ViewController.swift
//  proj1
//
//  Created by Nick on 02/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var logo: UIImageView = {
        var logo = UIImageView()
        logo.image = UIImage(named: "logo.png")
        logo.sizeToFit()
        return logo
    }()
    
    private var auth: UILabel = {
        var auth = UILabel()
        auth.text = "Авторизация"
        auth.textColor = .black
        auth.textAlignment = .center
        return auth
    }()
    
    private var login: UITextField = {
        var login = UITextField()
        login.placeholder = "Логин"
        login.textColor = .black
        login.textAlignment = .center
        return login
    }()
    
    private var pass: UITextField = {
        var pass = UITextField()
        pass.placeholder = "Пароль"
        pass.textColor = .black
        pass.textAlignment = .center
        return pass
    }()
    
    private var enter: UIButton = {
        var enter = UIButton()
        enter.setTitle("Войти", for: .normal)
        enter.setTitleColor(.black, for: .normal)
        return enter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    private let customFontSize = UIFont.systemFont(ofSize: 30)
    
    private func setupViews() {
        view.addSubview(logo)
        auth.font = customFontSize
        view.addSubview(auth)
        login.font = customFontSize
        view.addSubview(login)
        pass.font = customFontSize
        view.addSubview(pass)
        enter.titleLabel?.font = customFontSize
        view.addSubview(enter)
        setupConstraints()
    }
    
    private func setupConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        auth.translatesAutoresizingMaskIntoConstraints = false
        login.translatesAutoresizingMaskIntoConstraints = false
        pass.translatesAutoresizingMaskIntoConstraints = false
        enter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: view.frame.size.width-60),
            logo.heightAnchor.constraint(equalToConstant: logo.frame.size.width/5),
            
            auth.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            auth.centerXAnchor.constraint(equalTo: logo.centerXAnchor),
            auth.widthAnchor.constraint(equalToConstant: view.frame.size.width-20),
            
            login.topAnchor.constraint(equalTo: auth.bottomAnchor, constant: 10),
            login.centerXAnchor.constraint(equalTo: logo.centerXAnchor),
            login.widthAnchor.constraint(equalTo: logo.widthAnchor),
            
            pass.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 10),
            pass.centerXAnchor.constraint(equalTo: login.centerXAnchor),
            pass.widthAnchor.constraint(equalTo: login.widthAnchor),
            
            enter.topAnchor.constraint(equalTo: pass.bottomAnchor, constant: 10),
            enter.centerXAnchor.constraint(equalTo: logo.centerXAnchor),
            enter.widthAnchor.constraint(equalToConstant: view.frame.size.width-50)
        ])
    }


}

