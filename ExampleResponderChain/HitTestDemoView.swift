//
//  HitTestDemoView.swift
//  ExampleResponderChain
//
//  Created by Валентин on 13.08.2025.
//

import UIKit

class HitTestDemoView: UIView {
    
    // MARK: - UI Elements
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let hitTestArea = UIView()
    private let transparentView = TransparentView()
    private let overlappingView = OverlappingView()
    private let logTextView = UITextView()
    
    // MARK: - Properties
    private var logMessages: [String] = []
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupConstraints()
        setupGestures()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // Title
        titleLabel.text = "HitTest Demo"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .label
        
        // Description
        descriptionLabel.text = "Нажмите на разные области, чтобы увидеть, как работает HitTest"
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.numberOfLines = 0
        
        // HitTest Area
        hitTestArea.backgroundColor = .systemBlue
        hitTestArea.layer.cornerRadius = 8
        hitTestArea.layer.borderWidth = 2
        hitTestArea.layer.borderColor = UIColor.white.cgColor
        
        // Transparent View (прозрачная область)
        transparentView.backgroundColor = .clear
        transparentView.layer.borderWidth = 2
        transparentView.layer.borderColor = UIColor.systemRed.cgColor
        
        // Overlapping View (перекрывающая область)
        overlappingView.backgroundColor = .systemGreen
        overlappingView.layer.cornerRadius = 8
        overlappingView.alpha = 0.7
        
        // Log TextView
        logTextView.backgroundColor = .systemBackground
        logTextView.layer.cornerRadius = 8
        logTextView.layer.borderWidth = 1
        logTextView.layer.borderColor = UIColor.systemGray4.cgColor
        logTextView.font = .systemFont(ofSize: 12)
        logTextView.isEditable = false
        logTextView.text = "Лог событий HitTest:\n"
        
        // Add subviews
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(hitTestArea)
        addSubview(transparentView)
        addSubview(overlappingView)
        addSubview(logTextView)
        
        // Add initial log message
        addLogMessage("HitTest демо инициализировано")
        addLogMessage("💡 Нажмите на разные области для демонстрации")
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        hitTestArea.translatesAutoresizingMaskIntoConstraints = false
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        overlappingView.translatesAutoresizingMaskIntoConstraints = false
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
            
            // HitTest Area
            hitTestArea.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            hitTestArea.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hitTestArea.widthAnchor.constraint(equalToConstant: 100),
            hitTestArea.heightAnchor.constraint(equalToConstant: 60),
            
            // Transparent View
            transparentView.topAnchor.constraint(equalTo: hitTestArea.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: hitTestArea.trailingAnchor, constant: 20),
            transparentView.widthAnchor.constraint(equalToConstant: 100),
            transparentView.heightAnchor.constraint(equalToConstant: 60),
            
            // Overlapping View
            overlappingView.topAnchor.constraint(equalTo: transparentView.topAnchor),
            overlappingView.leadingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: 20),
            overlappingView.widthAnchor.constraint(equalToConstant: 100),
            overlappingView.heightAnchor.constraint(equalToConstant: 60),
            
            // Log TextView
            logTextView.topAnchor.constraint(equalTo: hitTestArea.bottomAnchor, constant: 16),
            logTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        
        // Добавляем подписи к областям
        addLabelsToAreas()
    }
    
    private func addLabelsToAreas() {
        // Подпись для HitTest Area
        let hitTestLabel = UILabel()
        hitTestLabel.text = "HitTest\nArea"
        hitTestLabel.font = .systemFont(ofSize: 12, weight: .medium)
        hitTestLabel.textColor = .white
        hitTestLabel.textAlignment = .center
        hitTestLabel.numberOfLines = 0
        hitTestLabel.translatesAutoresizingMaskIntoConstraints = false
        hitTestArea.addSubview(hitTestLabel)
        
        NSLayoutConstraint.activate([
            hitTestLabel.centerXAnchor.constraint(equalTo: hitTestArea.centerXAnchor),
            hitTestLabel.centerYAnchor.constraint(equalTo: hitTestArea.centerYAnchor)
        ])
        
        // Подпись для Transparent View
        let transparentLabel = UILabel()
        transparentLabel.text = "Transparent\nView"
        transparentLabel.font = .systemFont(ofSize: 12, weight: .medium)
        transparentLabel.textColor = .systemRed
        transparentLabel.textAlignment = .center
        transparentLabel.numberOfLines = 0
        transparentLabel.translatesAutoresizingMaskIntoConstraints = false
        transparentView.addSubview(transparentLabel)
        
        NSLayoutConstraint.activate([
            transparentLabel.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor),
            transparentLabel.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor)
        ])
        
        // Подпись для Overlapping View
        let overlappingLabel = UILabel()
        overlappingLabel.text = "Overlapping\nView"
        overlappingLabel.font = .systemFont(ofSize: 12, weight: .medium)
        overlappingLabel.textColor = .white
        overlappingLabel.textAlignment = .center
        overlappingLabel.numberOfLines = 0
        overlappingLabel.translatesAutoresizingMaskIntoConstraints = false
        overlappingView.addSubview(overlappingLabel)
        
        NSLayoutConstraint.activate([
            overlappingLabel.centerXAnchor.constraint(equalTo: overlappingView.centerXAnchor),
            overlappingLabel.centerYAnchor.constraint(equalTo: overlappingView.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self)
        addLogMessage("👆 Нажатие в точке: (\(Int(location.x)), \(Int(location.y)))")
        
        // Демонстрация HitTest
        performHitTest(at: location)
    }
    
    private func performHitTest(at point: CGPoint) {
        addLogMessage("🔍 Выполняется HitTest...")
        
        // Получаем view через HitTest
        if let hitView = hitTest(point, with: nil) {
            addLogMessage("🎯 HitTest вернул: \(type(of: hitView))")
            
            // Определяем, в какой области произошло нажатие
            if hitView == hitTestArea {
                addLogMessage("📍 Нажатие в HitTest Area (синяя область)")
                addLogMessage("✅ View может получать touch события")
            } else if hitView == transparentView {
                addLogMessage("📍 Нажатие в Transparent View (красная рамка)")
                addLogMessage("⚠️ View прозрачная, но может получать события")
            } else if hitView == overlappingView {
                addLogMessage("📍 Нажатие в Overlapping View (зеленая область)")
                addLogMessage("🔄 View перекрывает другие view")
            } else if hitView == self {
                addLogMessage("📍 Нажатие в основной HitTestDemoView")
                addLogMessage("📱 Основной view получил событие")
            } else {
                addLogMessage("📍 Нажатие в неизвестной области")
            }
            
            // Показываем иерархию view
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showViewHierarchy(for: hitView)
            }
        } else {
            addLogMessage("❌ HitTest не вернул view")
        }
    }
    
    private func showViewHierarchy(for view: UIView) {
        addLogMessage("📋 Иерархия view для \(type(of: view)):")
        
        var currentView: UIView? = view
        var level = 0
        
        while let view = currentView {
            let indent = String(repeating: "  ", count: level)
            let viewInfo = "\(indent)\(level). \(type(of: view))"
            addLogMessage(viewInfo)
            
            currentView = view.superview
            level += 1
            
            if level > 5 {
                addLogMessage("\(String(repeating: "  ", count: level))... (иерархия обрезана)")
                break
            }
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
    
    // MARK: - Override HitTest for Demo
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        addLogMessage("🔍 hitTest вызван в HitTestDemoView для точки (\(Int(point.x)), \(Int(point.y)))")
        
        // Вызываем стандартный hitTest
        let hitView = super.hitTest(point, with: event)
        
        if let hitView = hitView {
            addLogMessage("✅ Стандартный hitTest вернул: \(type(of: hitView))")
        } else {
            addLogMessage("❌ Стандартный hitTest вернул nil")
        }
        
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let isInside = super.point(inside: point, with: event)
        addLogMessage("📍 point(inside:) вызван: \(isInside ? "внутри" : "снаружи")")
        return isInside
    }
}

// MARK: - Transparent View (не получает touch события)
class TransparentView: UIView {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        // Эта view не получает touch события
        return false
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Всегда возвращаем nil, чтобы события проходили дальше
        return nil
    }
}

// MARK: - Overlapping View (перекрывает другие view)
class OverlappingView: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Проверяем, находится ли точка внутри bounds
        if bounds.contains(point) {
            // Если точка внутри, возвращаем себя
            return self
        }
        
        // Если точка снаружи, передаем событие дальше
        return super.hitTest(point, with: event)
    }
}
