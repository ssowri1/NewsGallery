//
//  DetailViewTests.swift
//  CollectioViewInfiniteLoadTests
//
//  Created by Sowrirajan S on 29/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import XCTest

class DetailViewTests: XCTestCase {
    var viewModel: DetailViewModel?
    var galleryData: [Gallery]?

    override func setUpWithError() throws {
        viewModel = DetailViewModel()
        galleryData = [Gallery(id: 100, title: "sampleTitle", imageName: "1", description: "SampleDescrition", date: "21-Apr-20"),
                    Gallery(id: 101, title: "sampleTitle1", imageName: "2", description: "SampleDescrition1", date: "22-Apr-20")]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        galleryData = nil
    }

    func testFilter() {
        viewModel?.gallery = galleryData!
        let gallery = viewModel?.filter(with: 101)
        XCTAssertNil(gallery)
    }
}
