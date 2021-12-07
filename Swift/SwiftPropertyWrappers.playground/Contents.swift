import UIKit

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    let container: UserDefaults
    
    var wrappedValue: T {
        get {
            container.object(forKey: key) as? T ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
    
    init(key: String,
         defaultValue: T,
         container: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.container = container
    }
}

extension UserDefaults {
    public enum Keys {
        static let hasOnboarded = "hasOnboarded"
    }
    @UserDefault(key: UserDefaults.Keys.hasOnboarded, defaultValue: false, container: .standard)
    static var hasOnboarded: Bool
}

func shouldShowOnboardingUI() {
    if UserDefaults.standard.bool(forKey: "hasOnbarded") {
        // show app
    } else {
        //
    }
}

class UserManager {
    @UserDefault(key: "usesTouchID", defaultValue: false)
    static var usesTouchID: Bool
    @UserDefault(key: "myEmail", defaultValue: nil)
    static var myEmail: String?
    @UserDefault(key: "isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
    
}
