//
//  EditViewController.swift
//  Test
//
//  Created by lim lee jing on 20/06/2021.
//  Copyright © 2021 lim lee jing. All rights reserved.
//

import Foundation


//
//  EditViewController.swift
//  Assignment
//
//  Created by lim lee jing on 19/06/2021.
//  Copyright © 2021 lim lee jing. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func editData(userData : UserData, indexpath : IndexPath)
    
  
}

class EditViewController: UIViewController {

    var userData :UserData
    let indexPath : IndexPath
    
    weak var delegate : EditViewControllerDelegate?
    
    let tableviewcontroller = ViewController()
    
   private var circleView : UIView = {
       let view = UIView()
        view.backgroundColor = .orange
       
       
       
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
                
        button.tintColor = .orange
                  button.setImage(UIImage.init(named: "left-arrow"), for: .normal)
                  button.addTarget(self, action: #selector(dismissRecord), for: .touchUpInside)
        
        return button
    }()
    private let firstNameLabel : UILabel = {
        let label = UILabel()
        label.text = "First Name*"
       
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let lastNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Last Name*"
       
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "Email"
       
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let phoneLabel : UILabel = {
        let label = UILabel()
        label.text = "Phone"
       
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let firstNameTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        
        textField.keyboardAppearance = .light
        textField.attributedPlaceholder = NSAttributedString(string: "First Name*", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return textField
    }()
    
    private let lastNameTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        
        textField.keyboardAppearance = .light
        textField.attributedPlaceholder = NSAttributedString(string: "Last Name*", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return textField
    }()
    
    private let emailTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        
        textField.keyboardAppearance = .light
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return textField
    }()
    
    private let phoneTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
        
        textField.keyboardAppearance = .light
        textField.attributedPlaceholder = NSAttributedString(string: "Phone", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return textField
    }()
    
    private lazy var nameFieldContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(firstNameTextField)
        firstNameTextField.centerY(inView: view)
        firstNameTextField.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 50, height: 50)
        
        view.addShadow()

        
        return view
    }()
    
    private lazy var nameFieldContainer2: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(lastNameTextField)
        lastNameTextField.centerY(inView: view)
        lastNameTextField.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 50, height: 50)
        
        view.addShadow()

        
        return view
    }()
    
    private lazy var nameFieldContainer3: UIView = {
          let view = UIView()
           view.backgroundColor = .white
           view.addSubview(emailTextField)
           emailTextField.centerY(inView: view)
           emailTextField.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 50, height: 50)
           
           view.addShadow()

           
           return view
       }()
    
    private lazy var nameFieldContainer4: UIView = {
          let view = UIView()
           view.backgroundColor = .white
           view.addSubview(phoneTextField)
           phoneTextField.centerY(inView: view)
           phoneTextField.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 50, height: 50)
           
           view.addShadow()

           
           return view
       }()
    
    private let continueButton : UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Save", for: .normal)
           button.backgroundColor = .orange
           button.layer.cornerRadius = 6
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = .boldSystemFont(ofSize: 16)
           button.heightAnchor.constraint(equalToConstant: 50).isActive = true
           button.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
           return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingLeft: 20,width: 40, height: 40)
        view.addSubview(circleView)
        circleView.centerX(inView: view)
        
        circleView.anchor( top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20 ,width: 120,height: 120)
        circleView.layer.cornerRadius = 120/2
        
     
        
        
        
        
        view.backgroundColor = .white
        view.addSubview(nameFieldContainer)
        nameFieldContainer.anchor(top: circleView.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 50, paddingLeft: 20,paddingRight: 20, height: 50)
        
        //first name label
        view.addSubview(firstNameLabel)
        firstNameLabel.anchor(left: view.leftAnchor, bottom: nameFieldContainer.topAnchor, paddingLeft: 21, paddingBottom: 8)
        
        
        view.addSubview(nameFieldContainer2)
        nameFieldContainer2.anchor(top: nameFieldContainer.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 50, paddingLeft: 20,paddingRight: 20, height: 50)
        
        //last Name label
        view.addSubview(lastNameLabel)
        lastNameLabel.anchor(left: view.leftAnchor, bottom: nameFieldContainer2.topAnchor, paddingLeft: 21, paddingBottom: 8)
        
        view.addSubview(nameFieldContainer3)
              nameFieldContainer3.anchor(top: nameFieldContainer2.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 50, paddingLeft: 20,paddingRight: 20, height: 50)
        
        //email label
        
               view.addSubview(emailLabel)
               emailLabel.anchor(left: view.leftAnchor, bottom: nameFieldContainer3.topAnchor, paddingLeft: 21, paddingBottom: 8)
        
        view.addSubview(nameFieldContainer4)
              nameFieldContainer4.anchor(top: nameFieldContainer3.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor, paddingTop: 50, paddingLeft: 20,paddingRight: 20, height: 50)
        
        //phone label
        view.addSubview(phoneLabel)
        phoneLabel.anchor(left: view.leftAnchor, bottom: nameFieldContainer4.topAnchor, paddingLeft: 21, paddingBottom: 8)
        
        view.addSubview(continueButton)
        continueButton.centerX(inView: view)
        continueButton.anchor(top: nameFieldContainer4.bottomAnchor, paddingTop: 30,  width: 200, height: 50)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    init(userData : UserData, indexPath: IndexPath) {
        
        self.userData = userData
        self.indexPath = indexPath
        firstNameTextField.text = userData.firstName
        lastNameTextField.text = userData.lastName
        emailTextField.text = userData.email
        phoneTextField.text = userData.phone
        
        print(userData)
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func dismissRecord(){
        self.dismiss(animated: true, completion: nil)
    }
    
     @objc func handleContinue (){
        
      
        
        if(firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty){
            let alert = UIAlertController(title: "Error", message: "please filled in required detail*", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "OK ", style: .cancel, handler: nil))
                  present(alert, animated: true , completion: nil)
        }else{
            guard let newFirstName = firstNameTextField.text else { return }
                  guard let newLastName = lastNameTextField.text else { return }
                  guard let newEmail = emailTextField.text else { return }
                  guard let newPhone = phoneTextField.text else { return }
            self.userData.firstName = newFirstName
            self.userData.lastName = newLastName
            self.userData.email = newEmail
            self.userData.phone = newPhone
            
            delegate?.editData(userData: self.userData, indexpath: self.indexPath)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

