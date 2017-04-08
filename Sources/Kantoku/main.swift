import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectLogger
import PerfectRequestLogger

// Define custom log file
RequestLogFile.location = "./log.log"
LogFile.location = "./log.log"

// Create HTTP server.
let server = HTTPServer()
server.serverPort = 8080

// Instantiate a logger
let myLogger = RequestLogger()

// Add the filters
// Request filter at high priority to be executed first
server.setRequestFilters([(myLogger, .high)])
// Response filter at low priority to be executed last
// server.setResponseFilters([(myLogger, .low)])

// Register your own routes and handlers
// Routes V1
var api1Routes = Routes(baseUri: "/api/v1", routes: Router.getRoutes())

// Add the routes to the server.
server.addRoutes(api1Routes)

// Add filters
server.setRequestFilters(Router.getFilters())

// JSON Registration
JSONDecoding.registerJSONDecodable(name: User.jsonRegisterName, creator: { return User() })

do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
