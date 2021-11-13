import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol,
    delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
