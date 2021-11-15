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
}
