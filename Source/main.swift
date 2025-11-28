import Golang
import CShit
import Foundation

@_cdecl("main")
func main(_: Int32, _: CStringPtr) -> Int32 {
    print("Hello, World!")

    let add = Add(34, 35)
    print("Golang Add(): \(add)")

    // NOTE: Doesn't leak any memory
    let hello = "Hello".toCStr, world = "World".toCStr
    let toPrint: CString = StringInterpolation(hello, world)

    defer { free(hello); free(world); free(toPrint); }

    print(String(cString: toPrint))

    // NOTE: One liner but leaks memory
    print(String(cString: StringInterpolation("Hello".toCStr, "World".toCStr)))

    /* INFO: Server stuff starts from here on */

    var retMsg: CString,  route: CString, message: CString
    defer { free(route); free(message); free(retMsg); }

    route = "/swift".toCStr
    message = "Hello from Swift".toCStr

    retMsg = HttpRegisterRoute(route, message)
    print("\n\(String(cString: retMsg))", terminator: "")

    route = "/apple".toCStr
    message = "Fuck you Apple.".toCStr

    retMsg = HttpRegisterRoute(route, message)
    print(String(cString: retMsg))

    let ret = HandleCServer()
    return ret;
}
