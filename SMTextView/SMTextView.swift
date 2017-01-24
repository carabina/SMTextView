//
//  SMTextView.swift
//  SMTextView
//
//  Created by Spencer Mandrusiak on 2017-01-22.
//  Copyright © 2017 Spencer Mandrusiak. All rights reserved.
//

import UIKit

@IBDesignable
class SMTextView: UITextView {
    
    var placeholderTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        initPlaceholder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
//        placeholderTextView = UITextView(frame: bounds)
//        placeholderTextView.textContainerInset = textContainerInset
//        placeholderTextView.text = self.placeholder
//        placeholderTextView.font = font
//        placeholderTextView.textColor = .lightGray
//        placeholderTextView.backgroundColor = .clear
//        placeholderTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(placeholderTapped)))
//        self.addSubview(placeholderTextView)
    }
    
    func initPlaceholder() {
        placeholderTextView = UITextView(frame: bounds)
        placeholderTextView.textContainerInset = textContainerInset
        placeholderTextView.text = self.placeholder
        placeholderTextView.font = font
        placeholderTextView.textColor = .lightGray
        placeholderTextView.backgroundColor = .clear
        placeholderTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(placeholderTapped)))
        self.addSubview(placeholderTextView)
    }
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        placeholderTextView.isHidden = true
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        if placeholderTextView != nil {
            if self.text.characters.count > 0 {
                placeholderTextView.isHidden = true
            }else {
                placeholderTextView.isHidden = false
            }
        }
        return true
    }

    
    //MARK: Actions
    func placeholderTapped(_ recognizer: UITapGestureRecognizer) {
        _ = self.becomeFirstResponder()
    }
    
    //MARK: Interface Builder
    @IBInspectable var placeholder: String? {
        didSet {
            if self.placeholderTextView != nil {
                self.placeholderTextView.text = placeholder
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor? = nil {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var topInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
    }
    @IBInspectable var leftInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
    }
    @IBInspectable var bottomInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
    }
    @IBInspectable var rightInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        if placeholderTextView == nil {
            initPlaceholder()
        }
    }
}

extension SMTextView {
}