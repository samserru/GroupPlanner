//
//  constants.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//

import Foundation
import SwiftUI

struct constants{
    static let buttonFont : Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 16) ?? UIFont.systemFont(ofSize: 16))
    static let textFont: Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 20) ?? UIFont.systemFont(ofSize: 20))
}

extension Color{
    static let highlight = Color("highlight")
}
extension Color{
    static let secondary = Color("secondary")
}
extension Color{
    static let font = Color("font")
}

enum ViewState{
    case login, signUp, authentication, forgotPassword, settings, createSurvey, survey, friends, list, detail, base
}
