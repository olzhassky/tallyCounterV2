import UIKit

class ViewController: UIViewController {
    var counter = 0
    var counterLabel: UILabel!
    var titleLabel: UILabel!
    var incrementButton: UIButton!
    var decrementButton: UIButton!
    var resetButton: UIButton!
    var editButton: UIButton!
    var authorLabel: UILabel!
    var linkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupScene()
        makeConstraints()
        addLink()
    }
    func addLink() {
        let attributedString = NSMutableAttributedString(string: "Instagram")
        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.link, value: "https://www.instagram.com", range: range)
        
        linkLabel.attributedText = attributedString
        linkLabel.isUserInteractionEnabled = true
        linkLabel.numberOfLines = 0
        linkLabel.textAlignment = .center
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(linkTapped))
        linkLabel.addGestureRecognizer(tapGesture)
    }
    
    private func setupViews() {
        titleLabel = UILabel()
        titleLabel.text = "Счетчик"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        counterLabel = UILabel()
        counterLabel.text = "\(counter)"
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.systemFont(ofSize: 100)
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        incrementButton = UIButton(type: .system)
        incrementButton.setTitle("+", for: .normal)
        incrementButton.addTarget(self, action: #selector(increment), for: .touchUpInside)
        incrementButton.layer.cornerRadius = 10
        incrementButton.titleLabel?.font = UIFont.systemFont(ofSize: 48)
        incrementButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        incrementButton.setTitleColor(.white, for: .normal)
        incrementButton.backgroundColor = .systemGreen
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        decrementButton = UIButton(type: .system)
        decrementButton.setTitle("-", for: .normal)
        decrementButton.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        decrementButton.backgroundColor = .systemRed
        decrementButton.layer.cornerRadius = 10
        decrementButton.titleLabel?.font = UIFont.systemFont(ofSize: 48)
        decrementButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        decrementButton.setTitleColor(.white, for: .normal)
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton = UIButton(type: .system)
        resetButton.setTitle("Сбросить", for: .normal)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        editButton = UIButton(type: .system)
        editButton.setTitle("Редактировать", for: .normal)
        editButton.addTarget(self, action: #selector(editTitle), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        authorLabel = UILabel()
        authorLabel.text = "Created by @jst.Olzhas"
        authorLabel.textAlignment = .center
        authorLabel.font = UIFont.systemFont(ofSize: 14)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        linkLabel = UILabel()
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupScene() {
        view.addSubview(titleLabel)
        view.addSubview(counterLabel)
        view.addSubview(incrementButton)
        view.addSubview(decrementButton)
        view.addSubview(resetButton)
        view.addSubview(editButton)
        view.addSubview(authorLabel)
        view.addSubview(linkLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            // тайтл
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // счетчик
            counterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            // плюс
            incrementButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 40),
            incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // минус
            decrementButton.topAnchor.constraint(equalTo: incrementButton.bottomAnchor, constant: 40),
            decrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            decrementButton.widthAnchor.constraint(equalTo: incrementButton.widthAnchor),
            
            // сброс
            resetButton.topAnchor.constraint(equalTo: decrementButton.bottomAnchor, constant: 100),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // редактироватьь
            editButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 30),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // афффтор
            authorLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            linkLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 30),
            linkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    @objc private func increment() {
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
    @objc private func decrement() {
        counter -= 1
        counterLabel.text = "\(counter)"
    }
    
    @objc private func reset() {
        counter = 0
        counterLabel.text = "\(counter)"
    }
    
    @objc private func linkTapped() {
        if let url = URL(string: "https://www.instagram.com/jst.olzhas/") {
            UIApplication.shared.open(url)
        }
    }
    @objc private func editTitle() {
        let alertController = UIAlertController(title: "Редактировать название", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = ""
        }
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first,
                  let newTitle = textField.text else {
                return
            }
            self?.titleLabel.text = newTitle
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

