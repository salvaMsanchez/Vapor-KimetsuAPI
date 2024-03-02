//
//  File.swift
//  
//
//  Created by Salva Moreno on 2/3/24.
//

import Vapor
import Fluent

struct PopulateInitialData_v0: AsyncMigration {
    func prepare(on database: FluentKit.Database) async throws {
        // MARK: - News
        let news0 = News(title: "Kimetsu no Yaiba: Mugen Train bate récords en Japón", body: "La película de anime Kimetsu no Yaiba: Mugen Train continúa su racha de éxito al convertirse en la película de mayor recaudación en la historia del cine japonés. Con una trama emocionante y animación impresionante, los fanáticos han acudido en masa a los cines, solidificando su posición como un fenómeno cultural.", imageURL: "/images/kimetsu_no_yaiba_mugen_train.jpg")

        let news1 = News(title: "Kimetsu no Yaiba anuncia segunda temporada", body: "Los aficionados de Kimetsu no Yaiba están de enhorabuena con el anuncio oficial de una segunda temporada. La noticia ha generado gran expectación entre los seguidores de la serie, quienes esperan con ansias nuevas aventuras de Tanjiro y sus compañeros demonios.", imageURL: "/images/kimetsu_no_yaiba_season2.jpg")

        let news2 = News(title: "Kimetsu no Yaiba inspira colaboración con marca de moda", body: "La popularidad de Kimetsu no Yaiba se extiende más allá del mundo del anime con una colaboración única entre la serie y una reconocida marca de moda. Esta colaboración promete llevar el estilo distintivo de los personajes a una nueva línea de ropa, atrayendo tanto a fans como a amantes de la moda.", imageURL: "/images/kimetsu_no_yaiba_fashion_collab.jpg")

        let news3 = News(title: "Kimetsu no Yaiba: Juego móvil alcanza 10 millones de descargas", body: "El juego móvil basado en Kimetsu no Yaiba ha superado un hito impresionante al alcanzar 10 millones de descargas en todo el mundo. Con una jugabilidad emocionante y gráficos impresionantes, los fanáticos de la serie han acogido con entusiasmo esta experiencia interactiva, consolidando aún más el éxito de la franquicia.", imageURL: "/images/kimetsu_no_yaiba_mobile_game.jpg")

        
        try await [news0, news1, news2, news3].create(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await News.query(on: database).delete()
    }
}
