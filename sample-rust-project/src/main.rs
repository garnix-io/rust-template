use rouille::router;
use std::env;

fn main() {
    let port: u16 = env::var("PORT")
        .expect("PORT env var must be set")
        .parse()
        .expect("PORT must be an integer from 0-65535");
    eprintln!("Listening on port {port}");
    rouille::start_server(("0.0.0.0", port), |req| {
        router!(req,
            (GET) (/) => {
                rouille::Response::text("Hello from rust!")
            },

            _ => rouille::Response::text("Not Found (from rust)").with_status_code(404)
        )
    });
}
