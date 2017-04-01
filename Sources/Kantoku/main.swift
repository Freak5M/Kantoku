import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectRequestLogger

// Define custom log file
RequestLogFile.location = "./HTTPLogFile.log"

// Create HTTP server.
let server = HTTPServer()

// Instantiate a logger
let myLogger = RequestLogger()

// Add the filters
// Request filter at high priority to be executed first
server.setRequestFilters([(myLogger, .high)])
// Response filter at low priority to be executed last
server.setResponseFilters([(myLogger, .low)])

// Set the webroot directory so static files such as the logo, can be served
server.documentRoot = "./webroot"

// Register your own routes and handlers
// Routes V1
var api1Routes = Routes(baseUri: "/api/v1", routes: Router.getRoutes())

// Add the routes to the server.
server.addRoutes(api1Routes)

// Set a listen port of 8080
server.serverPort = 8080

// JSON Registration
JSONDecoding.registerJSONDecodable(name: User.jsonRegisterName, creator: { return User() })

do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
