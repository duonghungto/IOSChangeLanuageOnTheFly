//
//  LanguageDefine.swift
//  ChangeLanuage
//
//  Created by DuongTo on 5/25/21.
//

import Foundation

enum AppLang: Int, CaseIterable {
    case english
    case vietnamese
    case korean
    case japanese
    
    var code: String {
        switch self {
            case .english: return "en"
            case .vietnamese: return "vi-VN"
            case .korean: return "ko"
            case .japanese: return "ja"
        }
    }
    var name: String {
        switch self {
            case .english: return "English"
            case .vietnamese: return "Tiếng Việt"
            case .korean: return "한국어"
            case .japanese: return "日本語"
        }
    }
}
