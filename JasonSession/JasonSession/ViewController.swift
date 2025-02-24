//
//  ViewController.swift
//  JasonSession
//
//  Created by JIDTP1408 on 24/02/25.
//

import UIKit
import SwiftUI

class ProductListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Embed SwiftUI View
        let productListView = ProductListView()
        let hostingController = UIHostingController(rootView: productListView)
        
        // Add as a child ViewController
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
