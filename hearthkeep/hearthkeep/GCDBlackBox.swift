//
//  GCDBlackBox.swift
//  hearthkeep
//
//  Created by Jordan  on 3/31/17.
//  Copyright © 2017 Jordan . All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
