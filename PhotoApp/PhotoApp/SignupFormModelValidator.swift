import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
}
