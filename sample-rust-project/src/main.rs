use rouille::router;

fn main() {
    eprintln!("Listening on port 3000");
    rouille::start_server("localhost:3000", |req| {
        router!(req,
            (GET) (/) => {
                rouille::Response::text("Hello from rust!")
            },

            _ => rouille::Response::empty_404()
        )
    });
}
