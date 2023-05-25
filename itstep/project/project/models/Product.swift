//
//  Product.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import Foundation


class Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    class Rating: Decodable {
        let rate: Double
        let count: Int
    }

}


struct Product2 {
    let id: String
    let title: String
    let price: String
    let image: String
    let amount: Int
}
