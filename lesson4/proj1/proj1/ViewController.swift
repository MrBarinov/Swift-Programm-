//
//  ViewController.swift
//  proj1
//
//  Created by Nick on 02/12/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    /*private var logo: UIImageView = {
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
    }()*/
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //enter.addTarget(self, action: #selector(tap), for: .touchUpInside)
        setupViews()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=51811489&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
        webView.load(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }
    
    private let customFontSize = UIFont.systemFont(ofSize: 30)
    
    private func setupViews() {
        /*view.addSubview(logo)
        auth.font = customFontSize
        view.addSubview(auth)
        login.font = customFontSize
        view.addSubview(login)
        pass.font = customFontSize
        view.addSubview(pass)
        enter.titleLabel?.font = customFontSize
        view.addSubview(enter)*/
        view.addSubview(webView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        /*logo.translatesAutoresizingMaskIntoConstraints = false
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
        ])*/
    }

    /*@objc*/ private func tap() {
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //tab1.tabBarItem.title = "Друзья"
        tab1.tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(systemName: "person"), tag: 0)
        //tab1.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: customFontSize], for: .normal)
        
        //tab2.tabBarItem.title = "Группы"
        //tab2.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: customFontSize], for: .normal)
        tab2.tabBarItem = UITabBarItem(title: "Группы", image: UIImage(systemName: "person.3"), tag: 1)
        
        //tab3.tabBarItem.title = "Фото"
        //tab3.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: customFontSize], for: .normal)
        tab3.tabBarItem = UITabBarItem(title: "Фото", image: UIImage(systemName: "photo"), tag: 2)
        
        let controllers = [tab1, tab2, tab3]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let firstWindow = firstScene.windows.first else {
            return
        }
        
        firstWindow.rootViewController = tabBarController
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
}
