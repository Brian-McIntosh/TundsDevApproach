//
//  APIConstants.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import Foundation

enum APIConstants {
    static let baseUrl = "https://animechan.vercel.app"
    //static let baseUrl = "https://icanhazdadjoke.com/"
    // "/api/random" is the endpoint
}

/*
 Why didn't we use a struct? (...essentially the same)
 1. don't want someone to instantiate this object
 2. you can't really create an instance of an enum
 3. like a namespace for our properties
*/

struct Constants {
    static let baseUrl = "https://animechan.vercel.app"
}
