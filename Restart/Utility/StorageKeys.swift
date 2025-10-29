//
//  AppStorageKeys.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

enum StorageKeys {
    case isOnboardingViewActive
    
    var key: String {
        switch(self) {
        case .isOnboardingViewActive:
            return "isOnboardingViewActive"
        }
    }
}
