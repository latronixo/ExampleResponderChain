//
//  ViewController.swift
//  ExampleResponderChain
//
//  Created by Валентин on 13.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    // MARK: - Custom Views for Demo
    private let responderChainDemoView = ResponderChainDemoView()
    private let hitTestDemoView = HitTestDemoView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupResponderChainDemo()
        setupHitTestDemo()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Title
        titleLabel.text = "Responder Chain & HitTest Demo"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        
        // Description
        descriptionLabel.text = "Демонстрация работы Responder Chain и HitTest в UIKit"
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.numberOfLines = 0
        
        // ScrollView setup
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(responderChainDemoView)
        contentView.addSubview(hitTestDemoView)
    }
    
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        responderChainDemoView.translatesAutoresizingMaskIntoConstraints = false
        hitTestDemoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Title
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Description
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Responder Chain Demo
            responderChainDemoView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            responderChainDemoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            responderChainDemoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            responderChainDemoView.heightAnchor.constraint(equalToConstant: 300),
            
            // HitTest Demo
            hitTestDemoView.topAnchor.constraint(equalTo: responderChainDemoView.bottomAnchor, constant: 30),
            hitTestDemoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hitTestDemoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            hitTestDemoView.heightAnchor.constraint(equalToConstant: 300),
            hitTestDemoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Demo Setup
    private func setupResponderChainDemo() {
        responderChainDemoView.backgroundColor = .systemGray6
        responderChainDemoView.layer.cornerRadius = 12
        responderChainDemoView.layer.borderWidth = 1
        responderChainDemoView.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    private func setupHitTestDemo() {
        hitTestDemoView.backgroundColor = .systemGray6
        hitTestDemoView.layer.cornerRadius = 12
        hitTestDemoView.layer.borderWidth = 1
        hitTestDemoView.layer.borderColor = UIColor.systemGray4.cgColor
    }
}

