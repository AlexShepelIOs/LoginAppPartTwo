//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Александр Шепель on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == "Admin" && passwordTextField.text == "Admin" else {
            showAlert(
                title: "Invalid Login or Password",
                message: "Please, enter correct login and password"
            )
            passwordTextField.text = ""
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.greetings = userNameTextField.text
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(title: "Oops!", message: "Your name is \"Admin\"!")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Oops!", message: "Your password is \"Admin\"!")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

