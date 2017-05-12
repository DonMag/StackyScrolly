//
//  ScrollWithStacksViewController.swift
//  StackyScrolly
//
//  Created by Don Mag on 5/12/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ScrollWithStacksViewController: UIViewController {

	@IBOutlet weak var theMainStack: UIStackView!
	
	@IBOutlet weak var theBottomView: UIView!
	@IBOutlet weak var theBottomStack: UIStackView!

	
	@IBAction func addTapped(_ sender: Any) {
		
		// if the bottom / inner stack view was empty,
		//	move the bottom View from self.view to the Main StackView
		//	and set the bottom View to NOT hidden
		
		if theBottomStack.arrangedSubviews.count == 0 {
			theBottomView.isHidden = false
			theMainStack.addArrangedSubview(theBottomView)
		}
		
		
		// create a new Label and add it to the bottom / inner stack view
		//	(setting background to Cyan just so we can see the individual labels)
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "This is Label \(theBottomStack.arrangedSubviews.count + 1)"
		label.backgroundColor = .cyan
		theBottomStack.addArrangedSubview(label)
		
	}
	
	@IBAction func removeTapped(_ sender: Any) {
		
		// if there are any labels currently in the bottom / inner stack view
		//	remove the last one
		
		if let v = theBottomStack.arrangedSubviews.last {
			v.removeFromSuperview()
		}
		
		// if the bottom / inner stack view is now empty,
		//	move the bottom View from the Main StackView to self.view
		//	and set the bottom View to hidden

		if theBottomStack.arrangedSubviews.count == 0 {
			self.view.addSubview(theBottomView)
			theBottomView.isHidden = true
		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.title = "Tableau de bord"

		// since the bottom / inner stack view starts out empty,
		//	move the bottom View from the Main StackView to self.view
		//	and set the bottom View to hidden
		//	this will keep it out of the Main StackView's height/spacing hierarchy
		
		self.view.addSubview(theBottomView)
		theBottomView.isHidden = true
		
    }

}
