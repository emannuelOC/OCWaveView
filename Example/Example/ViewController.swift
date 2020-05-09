//
//  ViewController.swift
//  Example
//
//  Created by Emannuel Carvalho on 15/03/17.
//  Copyright © 2017 OC. All rights reserved.
//

import UIKit
import OCWaveView

@IBDesignable
class ViewController: UIViewController {
    
    lazy var waveView: WaveView = {
        let waveView = WaveView()
        waveView.translatesAutoresizingMaskIntoConstraints = false
        return waveView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        view.addSubview(waveView)
        
        NSLayoutConstraint.activate([
            waveView.heightAnchor.constraint(equalToConstant: 200),
            waveView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            waveView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            waveView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func prepareForInterfaceBuilder() {
        configureView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configureView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [#colorLiteral(red: 0.7791045984, green: 0.3612275229, blue: 0.6627439169, alpha: 1), #colorLiteral(red: 0.3250321746, green: 0.2411090732, blue: 0.4993002415, alpha: 1)].map({ $0.cgColor })
        view.layer.insertSublayer(gradient, at: 0)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let value = touches.first?.location(in: view).x {
            waveView.value = value
        }
    }

}

