//
//  MoviesViewModelTests.swift
//  MoviesTests
//
//  Created by Juan Diego Marin on 1/11/22.
//

import XCTest
@testable import Movies

class MoviesViewModelTests: XCTestCase {
    
    // MARK: - Private Properties
    private var requestExpectation: XCTestExpectation?
    // MARK: - Subject under test
    private var viewModel: MoviesViewModel!
    // MARK: - Mock
    private var repositoryMock: MoviesRepositoryMock!

    
    
    // MARK: - Set up & Tear Down
    override func setUp() {
        super.setUp()
        repositoryMock = MoviesRepositoryMock()
        viewModel = MoviesViewModel(repository: repositoryMock)
    }

    override func tearDown() {
        super.tearDown()
        repositoryMock = nil
        viewModel = nil
    }
    
    // MARK Tests getMovie
    
    func testGetMovie() {
        // Given
        repositoryMock.movies = MovieFake.result
        // When
        getMovies()
        // Then
        XCTAssertEqual(requestExpectation?.expectationDescription, ResponseExpectation.ok.rawValue)
    }

}

private extension MoviesViewModelTests {
    
    func getMovies() {
        requestExpectation = expectation(description: ResponseExpectation.go.rawValue)
        viewModel.success = {
            self.requestExpectation?.expectationDescription = ResponseExpectation.ok.rawValue
            self.requestExpectation?.fulfill()
        }
        viewModel.getMovie()
        if let requestExpectation = requestExpectation {
            wait(for: [requestExpectation], timeout: 1)
        }
    }
}
