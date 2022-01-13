//
//  ViewController.swift
//  AttachmentsBasic
//
//  Created by jinho on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = CGRect(x: 0, y: 300, width: view.frame.self.width, height: 100)
        view.addSubview(label)
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let attrString = NSMutableAttributedString(
            string: "Please tap the following to start: ",
            attributes: [
                .foregroundColor: UIColor.label,
                .paragraphStyle: style,
                .font: UIFont.systemFont(ofSize: 25)
            ]
        )
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "bell")
        attachment.bounds = CGRect(x: 0, y: 0, width: 45, height: 45)
        attrString.append(NSAttributedString(attachment: attachment))
        
        attrString.append(.init(string: "- Get Notifications"))
        
        label.attributedText = attrString
    }
}

