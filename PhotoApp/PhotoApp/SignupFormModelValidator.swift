import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.count < SignupConstants.firstNameMinLength || firstname.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastname: String) -> Bool {
        var returnValue = true
        
        if lastname.count < SignupConstants.lastNameMinLength || lastname.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailValid(address: String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", SignupConstants.emailAddressRegex)
        
        return emailPred.evaluate(with: address)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passwordPred = NSPredicate(format: "SELF MATCHES %@ ", SignupConstants.passwordRegex)

        return passwordPred.evaluate(with: password)
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        var returnValue = true
        
        if password != repeatPassword {
            returnValue = false
        }
        
        return returnValue
    }
}
