import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var textFieldName: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var textFieldSurname: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter surname"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var textFieldPassword: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var labelAllMentionedTxtFields: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0 // Разрешаем многострочный текст
        label.text = "All mentioned text fields: "
        return label
    }()
    
    lazy var submitButton: UIButton = {
        var button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var editButton: UIButton = {
        var button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Добавление элементов на представление
        view.addSubview(textFieldName)
        view.addSubview(textFieldSurname)
        view.addSubview(textFieldPassword)
        view.addSubview(labelAllMentionedTxtFields)
        view.addSubview(submitButton)
        view.addSubview(editButton)
        
        // Настройка расположения элементов с помощью SnapKit
        textFieldName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-200)
            make.width.equalTo(350)
        }
        
        textFieldSurname.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
            make.width.equalTo(350)
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.width.equalTo(350)
        }
        
        labelAllMentionedTxtFields.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldPassword.snp.bottom).offset(20)
        }
        
        submitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-80)
            make.top.equalTo(labelAllMentionedTxtFields.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(80)
            make.top.equalTo(submitButton)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    // MARK: - Button Actions
    
    @objc func submitButtonTapped() {
        // Получение значений из текстовых полей
        guard let name = textFieldName.text, let surname = textFieldSurname.text, let password = textFieldPassword.text else {
            return
        }
        
        // Сохранение значений в UserDefaults
        UserDefaults.standard.set(name, forKey: "Name")
        UserDefaults.standard.set(surname, forKey: "Surname")
        UserDefaults.standard.set(password, forKey: "Password")
        
        // Обновление метки с информацией о всех введенных текстовых полях
        updateLabel()
    }
    
    @objc func editButtonTapped() {
        // Получение последних сохраненных значений из UserDefaults
        guard let name = UserDefaults.standard.string(forKey: "Name"),
              let surname = UserDefaults.standard.string(forKey: "Surname"),
              let password = UserDefaults.standard.string(forKey: "Password") else {
            return
        }
        
        // Изменение значений, если они были введены в текстовые поля
        if let newName = textFieldName.text, !newName.isEmpty {
            UserDefaults.standard.set(newName, forKey: "Name")
        }
        if let newSurname = textFieldSurname.text, !newSurname.isEmpty {
            UserDefaults.standard.set(newSurname, forKey: "Surname")
        }
        if let newPassword = textFieldPassword.text, !newPassword.isEmpty {
            UserDefaults.standard.set(newPassword, forKey: "Password")
        }
        
        // Обновление метки с информацией о всех введенных текстовых полях
        updateLabel()
    }
    
    // MARK: - Helper Methods
    
    func updateLabel() {
        // Получение значений из UserDefaults
        guard let name = UserDefaults.standard.string(forKey: "Name"),
              let surname = UserDefaults.standard.string(forKey: "Surname"),
              let password = UserDefaults.standard.string(forKey: "Password") else {
            return
        }
        
        // Обновление текста метки с информацией о всех введенных текстовых полях
        labelAllMentionedTxtFields.text = "Name: \(name)\nSurname: \(surname)\nPassword: \(password)"
    }
}





//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//
//    lazy var textFieldName: UITextField = {
//        var textField = UITextField()
//        textField.placeholder = "Enter name"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//
//    lazy var textFieldSurname: UITextField = {
//        var textField = UITextField()
//        textField.placeholder = "Enter surname"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//
//    lazy var textFieldPassword: UITextField = {
//        var textField = UITextField()
//        textField.placeholder = "Enter password"
//        textField.borderStyle = .roundedRect
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//
//    lazy var labelAllMentionedTxtFields: UILabel = {
//        var label = UILabel()
//        // Начальный текст метки
//        label.text = "All mentioned text fields: "
//        return label
//    }()
//
//    lazy var submitButton: UIButton = {
//        var button = UIButton()
//        // Настройка внешнего вида кнопки
//        button.setTitle("Submit", for: .normal)
//        button.backgroundColor = .blue
//        button.layer.cornerRadius = 8
//        button.setTitleColor(.white, for: .normal)
//        return button
//    }()
//
//    lazy var editButton: UIButton = {
//        var button = UIButton()
//        // Настройка внешнего вида кнопки
//        button.setTitle("Edit", for: .normal)
//        button.backgroundColor = .orange
//        button.layer.cornerRadius = 8
//        button.setTitleColor(.white, for: .normal)
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        // Добавление элементов на представление
//        view.addSubview(textFieldName)
//        view.addSubview(textFieldSurname)
//        view.addSubview(textFieldPassword)
//        view.addSubview(labelAllMentionedTxtFields)
//        view.addSubview(submitButton)
//        view.addSubview(editButton)
//
//        // Настройка расположения элементов с помощью SnapKit
//        textFieldName.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-200)
//            make.width.equalTo(350)
//        }
//
//        textFieldSurname.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-150)
//            make.width.equalTo(350)
//        }
//
//        textFieldPassword.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-100)
//            make.width.equalTo(350)
//        }
//
//        labelAllMentionedTxtFields.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(textFieldPassword.snp.bottom).offset(20)
//        }
//
//        submitButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().offset(-80)
//            make.top.equalTo(labelAllMentionedTxtFields.snp.bottom).offset(150)
//            make.width.equalTo(100)
//            make.height.equalTo(40)
//        }
//
//        editButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview().offset(80)
//            make.top.equalTo(submitButton)
//            make.width.equalTo(100)
//            make.height.equalTo(40)
//        }
//    }
//}
