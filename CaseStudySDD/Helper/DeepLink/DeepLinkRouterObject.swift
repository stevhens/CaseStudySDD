//
//  DeepLinkRouterObject.swift
//  CaseStudySDD
//
//  Created by Stevhen on 25/03/22.
//

struct DeepLinkRouterObject: Codable {
  enum RouteType: String, Codable, CaseIterable {
    case fourthcase
    case unknown
  }

  let type: RouteType
  let value: String
}
