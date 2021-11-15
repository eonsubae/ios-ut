import Foundation

struct SignupConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 10
    static let emailAddressRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let passwordMinLength = 4
    static let passwordMaxLength = 16
    static let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{\(passwordMinLength),\(passwordMaxLength)}$"
}
