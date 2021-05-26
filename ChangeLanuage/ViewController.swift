//
//  ViewController.swift
//  ChangeLanuage
//
//  Created by DuongTo on 5/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var languageButtons: [UIButton]!
    @IBOutlet private weak var contentImage: UIImageView!
    @IBOutlet private weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configSubviews()
    }
    
    
    private func configSubviews() {
        for i in 0..<self.languageButtons.count {
            languageButtons[i].setTitle(AppLang(rawValue: i)?.name, for: .normal)
        }
        fetchData()
    }

    @IBAction private func didTouchLanguageButtonsAt(_ sender: UIButton) {
        if let index = languageButtons.firstIndex(of: sender), let lang = AppLang(rawValue: index) {
            print(lang.code, lang.name)
            Bundle.setLanguage(lang.code)
            fetchData()
        }
    }
    
    private func fetchData() {
        contentImage.image = R.image.sampleImage()
        contentLabel.text = R.string.sampleLocalization.sampleContent(preferredLanguages: ["ja"])
        
    }
}

