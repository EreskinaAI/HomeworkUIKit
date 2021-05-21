//
//  ViewController.swift
//  UIKitHomework
//
//  Created by Анна Ереськина on 18.05.2021.
//

import UIKit

class MainVC: UIViewController {
    
    /// Кнопка специально сделана, выходящая за пределы круга donut, чтобы показать, что по углам происходит пробрасывание
    private lazy var buttonNext: UIButton = {
        let size: CGFloat = 200
        let button = UIButton(frame: CGRect(x: view.bounds.width / 2 - size / 2,
                                            y: view.bounds.height / 2 - size / 2,
                                            width: size,
                                            height: size))
        
        button.setTitle("ViewController2", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configurateNavBar()
    }
}

//MARK: User methods

extension MainVC {
    
    /// Настраиваем view
    private func setupView() {
        view.backgroundColor = .gray

        view.addSubview(buttonNext)
        configurateDonutView()
    }
    
    /// Конфигурируем бублик
    private func configurateDonutView() {
        let donutRadius: CGFloat = 120
        let innerRadius: CGFloat = 60
        
        let donut = DonutView(x: view.bounds.width / 2 - donutRadius,
                              y: view.bounds.height / 2 - donutRadius,
                              donutRadius: donutRadius,
                              holeRadius: innerRadius,
                              with: UIImage(named: "summer"))
        view.addSubview(donut)
    }
    
    /// Конфигурируем навигейшн бар
    private func configurateNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

//MARK:  Action
extension MainVC {
    
    /// Нажатие на кнопку
    @objc func buttonTapped() {
        let vc2 = VC2()
        navigationController?.pushViewController(vc2, animated: true)
    }
}

