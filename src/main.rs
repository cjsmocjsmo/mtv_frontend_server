use actix_cors::Cors;
use actix_files as fs;
use actix_web::{get, App, HttpResponse, HttpServer, Responder};

#[get("/test")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello From ATS Image Server!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin()
            .allow_any_method()
            .allow_any_header()
            .max_age(3600);
        App::new()
            .wrap(cors)
            .service(hello)
            .service(fs::Files::new("/", "/root/mtv/data").show_files_listing())
    })
    .bind(("0.0.0.0", 8123))?
    .run()
    .await
}