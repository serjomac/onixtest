//
//  NotificationsPermissonViewModel.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import Foundation
import UserNotifications

class NotificationsPermissonViewModel {
    
    var router: NotificationsPermissonRouter?
    
    init() {
        router = NotificationsPermissonRouter(viewModel: self)
    }
    
    func verifyNotifiactionsPermisson(completionHandler: @escaping(Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let _ = error {
                completionHandler(false)
            }
            if granted {
                completionHandler(true)
            } else {
                completionHandler(false)
            }
        }
    }
}
