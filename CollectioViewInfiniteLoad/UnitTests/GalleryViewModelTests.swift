//
//  GalleryViewModelTests.swift
//  CollectioViewInfiniteLoadTests
//
//  Created by Sowrirajan S on 29/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import XCTest

class GalleryViewModelTests: XCTestCase {

    var viewModel: GalleryViewModel?
    var galleryData: [Gallery]?
    override func setUpWithError() throws {
        viewModel = GalleryViewModel()
        galleryData = [Gallery(id: 100, title: "sampleTitle", imageName: "1", description: "SampleDescrition"),
                    Gallery(id: 101, title: "sampleTitle1", imageName: "2", description: "SampleDescrition1")]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        galleryData = nil
    }
    
    func testSetUser() {
        viewModel?.gallery = galleryData
        let gallery = viewModel?.setUser(index: 0)
        XCTAssertNotNil(gallery)
        XCTAssert(galleryData?.count == 2)
        XCTAssertEqual(gallery?.id, 100)
    }
    
    func testNumberOfRowsInSection() {
        let count = viewModel?.numberOfRowsinSection()
        XCTAssertNotNil(count)
        XCTAssertEqual(count, 10)
        XCTAssertEqual(viewModel?.gallery?[4].title, "After Bored Driver Plays Cards With Friends, 24 Infected With COVID-19")
    }
    
    func testCache() {
        _ = viewModel?.cache(data: galleryData!)
        XCTAssertNotNil(viewModel?.gallerData)
        XCTAssertEqual(viewModel?.gallerData?[1].id, 101)
    }
    
    func testLoadMoreData() {
        viewModel?.gallery = galleryData
        viewModel?.gallerData = galleryData
        _ = viewModel?.loadMoreData()
        XCTAssert(viewModel?.gallery?.count == 4)
    }
    
    func testGetSelectedId() {
        viewModel?.gallery = galleryData
        let indexPath = IndexPath(row: 1, section: 0)
        let id = viewModel?.getSelectedId(indexPath: indexPath)
        XCTAssertNotNil(id)
        XCTAssertEqual(id, 101)
    }
}
