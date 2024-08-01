    // For Using Reactive RxSwift, here's the needed pods

    pod 'NSObject+Rx','5.1.0'
    pod 'RxSwift','5.1.0'
    pod 'RxCocoa','5.1.1'
    pod 'RxDataSources','4.0.1'
    pod 'RxOptional','4.1.0'
    pod 'Moya/RxSwift','14.0.0'
    pod 'SDWebImage', '~> 5.0'


    // For Setting Up Scene Delegate
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    self.window = window
    
    let rootViewController = UINavigationController(rootViewController: )
    rootViewController.isNavigationBarHidden = true

    window.rootViewController = rootViewController
    window.makeKeyAndVisible()

    // For API Target Template
    internal enum ExampleTarget {
        case getList
    }

    extension ExampleTarget: TargetType {
        var baseURL: URL {
            return URL(string: "")!
        }
        
        var path: String {
            switch self {
                case .getList:
                    return "api/getList"
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .getList:
                return nil
            }
        }
        
        var parameterEncoding: ParameterEncoding {
            return URLEncoding.default
        }
        
        var method: Moya.Method {
            switch self {
                default:
                    return .get
            }
        }
        
        var headers: [String : String]? {
            switch self {
                default:
                    return ["Content-Type": "application/json"]
            }
        }
        
        var task: Task {
            return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
        }
        
        var sampleData: Data {
            return "{\"data\": 123}".data(using: .utf8)!
        }
    }

    // For More Clear Identifier and NIB Name
    extension UIView {
        static var identifier: String {
            return String(describing: self)
        }
        
        static var nib: UINib {
            return UINib(nibName: self.identifier, bundle: nil)
        }
    }

    // For Pushing
    extension UIApplication {
        class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
            if let navigationController = controller as? UINavigationController {
                return topViewController(controller: navigationController.visibleViewController)
            }
            if let tabController = controller as? UITabBarController {
                if let selected = tabController.selectedViewController {
                    return topViewController(controller: selected)
                }
            }
            if let presented = controller?.presentedViewController {
                return topViewController(controller: presented)
            }
            return controller
        }
    }