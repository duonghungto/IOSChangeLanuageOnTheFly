//
//  AnyLanguageBundle.swift
//  ChangeLanuage
//
//  Created by DuongTo on 5/26/21.
//

import Foundation
import UIKit.UIImage

var bundleKey: UInt8 = 0

class AnyLanguageBundle: Bundle {
    
    override func localizedString(forKey key: String,
                                  value: String?,
                                  table tableName: String?) -> String {
        
        guard let path = objc_getAssociatedObject(self, &bundleKey) as? String,
              let bundle = Bundle(path: path) else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    
    class func configLanguage() {
        if let lang = Bundle.appLanguageCode {
            Bundle.setLanguage(lang)
        }
    }
    
    private static var appLanguageCode: String? {
        get {
            return UserDefaults.standard.string(forKey: "\(Self.self).appLanguageCode")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "\(Self.self).appLanguageCode")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func setLanguage(_ language: String) {
        defer {
            object_setClass(Bundle.main, AnyLanguageBundle.self)
        }
        objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        appLanguageCode = language
    }
}
