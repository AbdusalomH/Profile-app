//
//  ViewController.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 10/2/21.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    
    func showLoadingView() {
        
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        
        containerView.backgroundColor = .systemBackground
        
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)

        ])
        activityIndicator.startAnimating()
    }
    
    
    func removeLoadingView() {
        
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
            
        }
 
    }
 
}
