//
//  ForYouDicodingFundamentalSub1Tests.swift
//  ForYouDicodingFundamentalSub1Tests
//
//  Created by Moh Zinnur Atthufail Addausi on 09/09/20.
//  Copyright © 2020 Moh Zinnur Atthufail Addausi. All rights reserved.
//
@testable import ForYouDicodingFundamentalSub1
import XCTest


class ForYouDicodingFundamentalSub1Tests: XCTestCase {
    
//    
    let game: [Games] = {
        let game = Games(results: [
            Result.stub(id: 1, slug: "3", name: "dnn", released: "dnjn", backgroundImage: "ndnsj", rating: 2.4)
            ])
            return[game]

      }()
//    
//    
    
    class GameListUseCaseMock : GameListUseCase   {
        
        var expectation: XCTestExpectation?
        var error: Error?
        var game = Games()
        func load(key: String, completion: @escaping ((Swift.Result<Games, Error>) -> Void)) {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(game))
            }
            expectation?.fulfill()
        }
        
    }
    
    
    
    //    }
    
    //
    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //    }
    //
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    //
    //    func testExample() throws {
    //        // This is an example of a functional test case.
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //    }
    //
    //    func testPerformanceExample() throws {
    //        // This is an example of a performance test case.
    //        measure {
    //            // Put the code you want to measure the time of here.
    //        }
}



