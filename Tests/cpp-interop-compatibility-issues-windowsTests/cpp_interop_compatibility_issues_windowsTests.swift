import WinSDK
import XCTest
@testable import cpp_interop_compatibility_issues_windows

final class cpp_interop_compatibility_issues_windowsTests: XCTestCase {
    func testExample() throws {
        let path = try Paths.getKnownFolderPath(FOLDERID_Windows)

        XCTAssertEqual(path, "C:\\Windows")
    }
}
