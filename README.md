# Responder Chain & HitTest Demo

Этот проект демонстрирует работу **Responder Chain** и **HitTest** в UIKit на практических примерах.

## 🎯 Что демонстрирует проект

### 1. Responder Chain (Цепочка ответчиков)
- **Определение**: Механизм, который определяет, какой объект должен обработать событие в iOS приложении
- **Принцип работы**: События передаются вверх по иерархии responder'ов до тех пор, пока не будут обработаны
- **Порядок**: View → ViewController → UIWindow → UIApplication

### 2. HitTest
- **Определение**: Процесс определения, какая view должна получить touch событие
- **Принцип работы**: Система проверяет, какая view находится под точкой касания
- **Ключевые методы**: `hitTest(_:with:)` и `point(inside:with:)`

## 🚀 Как использовать

1. **Запустите приложение**
2. **Responder Chain Demo**: Нажмите на кнопки 1, 2, 3 для демонстрации
3. **HitTest Demo**: Нажмите на разные области для демонстрации

## 📱 Responder Chain Demo

### Кнопка 1: Стандартная цепочка
- Показывает, как событие проходит по всей цепочке responder'ов
- Демонстрирует стандартный поток событий

### Кнопка 2: Перехват события
- Показывает, как можно перехватить событие
- Событие не передается дальше по цепочке

### Кнопка 3: Анализ цепочки
- Показывает полную цепочку responder'ов
- Демонстрирует иерархию объектов

## 🎯 HitTest Demo

### Синяя область (HitTest Area)
- Стандартная view, которая получает touch события
- Демонстрирует обычное поведение HitTest

### Красная рамка (Transparent View)
- View, которая не получает touch события
- `point(inside:)` возвращает `false`
- `hitTest` возвращает `nil`

### Зеленая область (Overlapping View)
- View с кастомной логикой HitTest
- Демонстрирует переопределение методов

## 🔧 Ключевые методы

### Responder Chain
```swift
// Получение следующего responder'а
var next: UIResponder? { get }

// Обработка touch событий
func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
```

### HitTest
```swift
// Определение view под точкой
func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?

// Проверка, находится ли точка внутри view
func point(inside point: CGPoint, with event: UIEvent?) -> Bool
```

## 💡 Практические применения

### Responder Chain
- **Передача событий**: От view к viewController
- **Глобальные обработчики**: В UIApplication
- **Кастомная логика**: Перехват и модификация событий

### HitTest
- **Touch области**: Определение активных зон
- **Прозрачные view**: Создание "дырок" в интерфейсе
- **Перекрытие**: Управление порядком обработки событий
- **Кастомные жесты**: Специальная логика для определенных областей

## 🎨 Архитектура проекта

```
ViewController
├── ResponderChainDemoView
│   ├── CustomButton (3 кнопки)
│   └── Log TextView
└── HitTestDemoView
    ├── HitTest Area (синяя)
    ├── Transparent View (красная рамка)
    ├── Overlapping View (зеленая)
    └── Log TextView
```

## 🔍 Что происходит при нажатии

1. **Touch событие** генерируется системой
2. **HitTest** определяет, какая view должна получить событие
3. **View** обрабатывает событие или передает его в Responder Chain
4. **Responder Chain** передает событие вверх до обработки

## 📚 Дополнительные материалы

- [Apple Documentation: Event Handling](https://developer.apple.com/documentation/uikit/touches_presses_and_gestures)
- [Apple Documentation: UIResponder](https://developer.apple.com/documentation/uikit/uiresponder)
- [Apple Documentation: UIView](https://developer.apple.com/documentation/uikit/uiview)

## 🎓 Для собеседования

### Ключевые вопросы:
1. **Что такое Responder Chain?**
2. **Как работает HitTest?**
3. **Когда использовать переопределение этих методов?**
4. **Как создать прозрачную view для touch событий?**
5. **Как передать событие дальше по цепочке?**

### Практические задачи:
1. Создать view, которая не получает touch события
2. Реализовать кастомную логику HitTest
3. Перехватить событие в определенном responder'е
4. Создать сложную иерархию view с кастомной обработкой событий

Этот проект поможет вам понять и продемонстрировать глубокое знание системы событий iOS на собеседовании! 🚀

