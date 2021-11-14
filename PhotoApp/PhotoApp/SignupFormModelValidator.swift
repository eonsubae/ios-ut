import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstname: String) -> Bool {
        var returnValue = true
        
        if firstname.count < 2 {
            returnValue = false
        }
        
        return returnValue
    }
}
