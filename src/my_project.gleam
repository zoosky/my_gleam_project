import gleam/io
import gleam/http/elli
import gleam/http.{Request, Response}
import gleam/bit_builder.{BitBuilder}

pub fn my_service(req: Request(BitString) -> Response(BitBuilder) {
  let body = bit_builder.from_string("Hello, world!")

  http.response(200)
  |> http.repend_resp_header("made-with", "Gleam")
  |> http.set_resp_body(body)
} 

pub fn main() {
  io.println("Hello from my_project!")
  elli.start(my_service, on_port: 3333)
}
