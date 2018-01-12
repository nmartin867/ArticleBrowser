//
//  BackendError.swift
//  ArticleBrowser
//
//  Created by Nick Martin on 1/11/18.
//  Copyright © 2018 MonkeyMan Technology. All rights reserved.
//

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}
