//
//  MessengerType.swift
//  ApplicationGroupKit
/*
The MIT License (MIT)

Copyright (c) 2015 Eric Marchand (phimage)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/


import Foundation

public enum MessengerType {
    case UserDefaults
    case File(directory: String?)
    case FileCoordinator(directory: String?, fileCoordinator: NSFileCoordinator)
    case KeyChain(service: String)
    // case WatchKitSession
    case Custom(Messenger)
}

extension MessengerType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .UserDefaults:
            return "UserDefaults"
        case .File(let directory):
            if let d = directory {
                return "File(\(d)"
            }
            return "File"
        case .FileCoordinator(let directory, _):
            if let d = directory {
                return "FileCoordinator(\(d)"
            }
            return "FileCoordinator"
        case .KeyChain(let service):
            return "KeyChain(\(service)"
        case Custom(let messenger):
            return "Custom(\(messenger))"
        }
    }
}
