use rouille::router;

fn main() {
    rouille::start_server("localhost:3000", |req| {
        router!(req,
            (GET) (/) => {
                rouille::Response::text("Hello from rust!")
            },

            _ => rouille::Response::empty_404()
        )
    });
}
