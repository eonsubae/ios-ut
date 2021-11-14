import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.count < SignupConstants.firstNameMinLength || firstname.count > SignupConstants.fisrtNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
}
