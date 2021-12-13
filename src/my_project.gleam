import gleam/io
import gleam/http/elli
import gleam/http.{Request, Response}
import gleam/bit_builder.{BitBuilder}
import gleam/erlang

// Define a HTTP service
//
pub fn my_service(req: Request(BitString)) -> Response(BitBuilder) {
  let body = bit_builder.from_string("Hello, world!")

  http.response(200)
  |> http.prepend_resp_header("made-with", "Gleam")
  |> http.set_resp_body(body)
}

pub fn main() {
  io.println("Hello from my_project!")
  assert Ok(_) = start_server()
  io.println("Started listening on localhost:3333 ✨")
  // Put the main process to sleep while the web server does its thing
  erlang.sleep_forever()
}

pub fn start_server() {
  elli.start(my_service, on_port: 3333)
}
