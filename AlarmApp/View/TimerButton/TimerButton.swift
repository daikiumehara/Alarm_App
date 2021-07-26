//
//  TimerButton.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/26.
//

import UIKit

class TimerButton: UIView {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private var view: UIView!

    private var didTap: (() -> Void)!


    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    private func loadNib() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

    func configure(color: UIColor, didTap: @escaping () -> Void) {
        self.alpha = 0.7
        self.backgroundView.backgroundColor = color
        self.view.backgroundColor = color
        self.backgroundView.layer.cornerRadius = self.backgroundView.bounds.width / 2
        self.view.layer.cornerRadius = self.view.bounds.width / 2
        self.view.layer.borderColor = UIColor.clear.cgColor
        self.view.layer.borderWidth = 2.0
        self.didTap = didTap
    }
}
