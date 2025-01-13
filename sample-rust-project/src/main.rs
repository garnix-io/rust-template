use rouille::router;

const PORT: u16 = 3000;

fn main() {
    eprintln!("Listening on port {PORT}");
    rouille::start_server(("0.0.0.0", PORT), |req| {
        router!(req,
            (GET) (/) => {
                rouille::Response::text("Hello from rust!")
            },

            _ => rouille::Response::text("Not Found (from rust)").with_status_code(404)
        )
    });
}
