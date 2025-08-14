//
//  ResponderChainDemoView.swift
//  ExampleResponderChain
//
//  Created by Валентин on 13.08.2025.
//

import UIKit

class ResponderChainDemoView: UIView {
    
    // MARK: - UI Elements
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let button1 = CustomButton(title: "Button 1", backgroundColor: .systemBlue)
    private let button2 = CustomButton(title: "Button 2", backgroundColor: .systemGreen)
    private let button3 = CustomButton(title: "Button 3", backgroundColor: .systemOrange)
    private let logTextView = UITextView()
    
    // MARK: - Properties
    private var logMessages: [String] = []
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // Title
        titleLabel.text = "Responder Chain Demo"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .label
        
        // Description
        descriptionLabel.text = "Нажмите на кнопки, чтобы увидеть, как события проходят по цепочке responder'ов"
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.numberOfLines = 0
        
        // Log TextView
        logTextView.backgroundColor = .systemBackground
        logTextView.layer.cornerRadius = 8
        logTextView.layer.borderWidth = 1
        logTextView.layer.borderColor = UIColor.systemGray4.cgColor
        logTextView.font = .systemFont(ofSize: 12)
        logTextView.isEditable = false
        logTextView.text = "Лог событий Responder Chain:\n"
        
        // Add subviews
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        addSubview(logTextView)
        
        // Add initial log message
        addLogMessage("Responder Chain инициализирован")
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        logTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // Description
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // Buttons
            button1.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            button1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button1.widthAnchor.constraint(equalToConstant: 80),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: button1.topAnchor),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 80),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: button1.topAnchor),
            button3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button3.widthAnchor.constraint(equalToConstant: 80),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
            // Log TextView
            logTextView.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 16),
            logTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func setupActions() {
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func button1Tapped() {
        addLogMessage("🎯 Button 1 нажата")
        addLogMessage("📱 Событие передается в Responder Chain")
        
        // Демонстрация передачи события вверх по цепочке
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.addLogMessage("⬆️ Событие передается в ResponderChainDemoView")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.addLogMessage("⬆️ Событие передается в ViewController")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.addLogMessage("⬆️ Событие передается в UIWindow")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.addLogMessage("⬆️ Событие передается в UIApplication")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.addLogMessage("✅ Событие обработано или проигнорировано")
        }
    }
    
    @objc private func button2Tapped() {
        addLogMessage("🎯 Button 2 нажата")
        addLogMessage("🔄 Демонстрация кастомного обработчика событий")
        
        // Демонстрация перехвата события
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.addLogMessage("🛑 Событие перехвачено в ResponderChainDemoView")
            self.addLogMessage("❌ Событие НЕ передается дальше по цепочке")
        }
    }
    
    @objc private func button3Tapped() {
        addLogMessage("🎯 Button 3 нажата")
        addLogMessage("🔍 Демонстрация поиска следующего responder'а")
        
        // Демонстрация поиска следующего responder'а
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let nextResponder = self.next {
                self.addLogMessage("🔍 Следующий responder: \(type(of: nextResponder))")
            } else {
                self.addLogMessage("🔍 Следующий responder не найден")
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.addLogMessage("📋 Полная цепочка responder'ов:")
            self.logResponderChain()
        }
    }
    
    // MARK: - Helper Methods
    private func addLogMessage(_ message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        let logEntry = "[\(timestamp)] \(message)"
        logMessages.append(logEntry)
        
        // Обновляем TextView
        DispatchQueue.main.async {
            self.logTextView.text = self.logMessages.joined(separator: "\n")
            
            // Прокручиваем к последнему сообщению
            let bottom = NSMakeRange(self.logTextView.text.count - 1, 1)
            self.logTextView.scrollRangeToVisible(bottom)
        }
    }
    
    private func logResponderChain() {
        var responder: UIResponder? = self
        var chain: [String] = []
        var level = 0
        
        while let currentResponder = responder {
            let indent = String(repeating: "  ", count: level)
            let responderInfo = "\(indent)\(level). \(type(of: currentResponder))"
            chain.append(responderInfo)
            
            responder = currentResponder.next
            level += 1
            
            // Ограничиваем глубину для избежания бесконечного цикла
            if level > 10 {
                chain.append("\(String(repeating: "  ", count: level))... (цепочка обрезана)")
                break
            }
        }
        
        for responderInfo in chain {
            addLogMessage(responderInfo)
        }
    }
    
    // MARK: - Override Methods for Responder Chain Demo
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addLogMessage("👆 touchesBegan вызван в ResponderChainDemoView")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        addLogMessage("👆 touchesEnded вызван в ResponderChainDemoView")
        super.touchesEnded(touches, with: event)
    }
}

// MARK: - Custom Button Class
class CustomButton: UIButton {
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Анимация нажатия
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Возврат к исходному размеру
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = .identity
        })
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Возврат к исходному размеру при отмене
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = .identity
        })
        super.touchesCancelled(touches, with: event)
    }
}

