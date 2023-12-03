//
//  PushNotificationBodyResponse.swift
//  CaseStudySDD
//
//  Created by Stevhen on 25/03/22.
//

import Foundation

struct PushNotificationBodyResponse: Decodable {
  var deepLink: String?
  var type: String?
}
