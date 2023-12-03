//
//  FourthCaseViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

final class FourthCaseViewController: UIViewController, FourthCasePresenterOutput {
  // MARK: - Variables
    var input: FourthCaseInteractorInput?
    var router: FourthCaseRoutingDelegate?
    
    // MARK: - Initalizer
    init() {
        super.init(nibName: nil, bundle: nil)
        FourthCaseConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        FourthCaseConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Fourth Case"
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCustomNavbar(showBottomHairline: true)
  }

  // MARK: - IBActions
    @IBAction func didTapSendNotification(_ sender: UIButton) {
        let sender = PushNotificationSender()
        sender.sendPushNotification(to: AppData.fcmToken, title: "Push Notification!", body: "Please check your transaction result")
    }
}
