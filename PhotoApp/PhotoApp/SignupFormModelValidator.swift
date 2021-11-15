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
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: address)
    }
}
