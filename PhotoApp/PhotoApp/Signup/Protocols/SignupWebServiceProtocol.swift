import Foundation

protocol SignupWebServiceProtocol {
        func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) 
}
