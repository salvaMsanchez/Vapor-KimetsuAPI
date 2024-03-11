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
        
        
        // MARK: - Characters
        let tanjiro = Character(name: "Tanjiro Kamado")
        let nezuko = Character(name: "Nezuko Kamado")
        let zenitsu = Character(name: "Zenitsu Agatsuma")
        let inosuke = Character(name: "Inosuke Hashibira")
        let giyuu = Character(name: "Giyuu Tomioka")
        let kanao = Character(name: "Kanao Tsuyuri")
        let muzan = Character(name: "Muzan Kibutsuji")
        let shinobu = Character(name: "Shinobu Kocho")
        let sanemi = Character(name: "Sanemi Shinazugawa")
        let gyomei = Character(name: "Gyomei Himejima")
        
        await withThrowingTaskGroup(of: Void.self) { taskGroup in
            [tanjiro, nezuko, zenitsu, inosuke, giyuu, kanao, muzan, shinobu, sanemi, gyomei].forEach { model in
                taskGroup.addTask {
                    try await model.create(on: database)
                }
            }
        }
        
        // Mark: - Episodes
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let episode001 = Episode(episodeNumber: 1, title: "Un misterioso guerrero", airedAt: dateFormatter.date(from: "2022-04-10T00:00:00Z") ?? Date(), summary: "Tanjiro Kamado, un bondadoso joven que vende carbón, se ve obligado a abandonar su vida pacífica cuando su familia es brutalmente asesinada por un demonio, dejando solo a su hermana Nezuko y él. Determinado a vengarse y salvar a su hermana, Tanjiro se embarca en un viaje como cazador de demonios.", imageURL: "/images/episodes/episode001.jpg")

        let episode002 = Episode(episodeNumber: 2, title: "La prueba final", airedAt: dateFormatter.date(from: "2022-04-17T00:00:00Z") ?? Date(), summary: "Tanjiro comienza su entrenamiento como cazador de demonios en la Mansión de Urokodaki. Debe superar una dura prueba para demostrar su valía. Mientras tanto, Nezuko muestra una sorprendente habilidad para resistir sus instintos demoníacos.", imageURL: "/images/episodes/episode002.jpg")

        let episode003 = Episode(episodeNumber: 3, title: "El maestro espadachín", airedAt: dateFormatter.date(from: "2022-04-24T00:00:00Z") ?? Date(), summary: "Tanjiro conoce al maestro espadachín Giyuu Tomioka, quien lo somete a una prueba aún más difícil. Mientras tanto, una fuerza demoníaca se cierne sobre el monte.", imageURL: "/images/episodes/episode003.jpg")

        let episode004 = Episode(episodeNumber: 4, title: "La mansión de los Insectos", airedAt: dateFormatter.date(from: "2022-05-01T00:00:00Z") ?? Date(), summary: "Tanjiro y Nezuko son enviados a investigar una serie de desapariciones en una mansión cercana. Allí, se enfrentan a un peligroso demonio que controla a las víctimas con hilos de araña.", imageURL: "/images/episodes/episode004.jpg")

        let episode005 = Episode(episodeNumber: 5, title: "Mujeres arañas", airedAt: dateFormatter.date(from: "2022-05-08T00:00:00Z") ?? Date(), summary: "Tanjiro, Nezuko y sus compañeros se enfrentan a un grupo de demonios araña que han secuestrado a varios habitantes de un pueblo. En medio de la batalla, Tanjiro demuestra su habilidad única para percibir los sentimientos de los demonios.", imageURL: "/images/episodes/episode005.jpg")

        let episode006 = Episode(episodeNumber: 6, title: "Montaña de diversión", airedAt: dateFormatter.date(from: "2022-05-15T00:00:00Z") ?? Date(), summary: "El Cuerpo de Cazadores de Demonios envía a Tanjiro y sus amigos a investigar una serie de desapariciones en una montaña. Allí, se encuentran con un demonio que se alimenta de los sueños de sus víctimas.", imageURL: "/images/episodes/episode006.jpg")

        let episode007 = Episode(episodeNumber: 7, title: "Paseo nocturno", airedAt: dateFormatter.date(from: "2022-05-22T00:00:00Z") ?? Date(), summary: "Mientras investigan un pueblo plagado de demonios, Tanjiro y sus compañeros son emboscados por una luna demoníaca. La batalla que sigue pondrá a prueba sus habilidades y su valentía.", imageURL: "/images/episodes/episode007.jpg")

        let episode008 = Episode(episodeNumber: 8, title: "El tambor del demonio", airedAt: dateFormatter.date(from: "2022-05-29T00:00:00Z") ?? Date(), summary: "Tanjiro, Inosuke y Zenitsu enfrentan a un demonio tamborilero cuyo ritmo hipnótico pone a sus víctimas en un trance mortal. Mientras luchan por mantenerse despiertos, descubren los oscuros secretos de la montaña.", imageURL: "/images/episodes/episode008.jpg")

        let episode009 = Episode(episodeNumber: 9, title: "El niño demonio", airedAt: dateFormatter.date(from: "2022-06-05T00:00:00Z") ?? Date(), summary: "Los cazadores de demonios se encuentran con un niño demonio que ha sido manipulado por un demonio mayor. Mientras luchan contra el demonio, Tanjiro descubre un doloroso vínculo entre él y el demonio niño.", imageURL: "/images/episodes/episode009.jpg")

        let episode010 = Episode(episodeNumber: 10, title: "El misterioso hogar de los demonios", airedAt: dateFormatter.date(from: "2022-06-12T00:00:00Z") ?? Date(), summary: "Tanjiro y sus compañeros llegan a una montaña donde se rumorea que se encuentra la sede de la Familia Araña. Allí, descubren un antiguo y siniestro culto que adora a los demonios.", imageURL: "/images/episodes/episode010.jpg")

        await withThrowingTaskGroup(of: Void.self) { taskGroup in
            [episode001, episode002, episode003, episode004, episode005, episode006, episode007, episode008, episode009, episode010].forEach { model in
                taskGroup.addTask {
                    try await model.create(on: database)
                }
            }
        }
        
        // MARK: - Episode+Character
        try await episode001.$characters.attach([tanjiro, nezuko, giyuu], on: database)
        try await episode002.$characters.attach([tanjiro, nezuko, giyuu], on: database)
        try await episode003.$characters.attach([tanjiro, giyuu], on: database)
        try await episode004.$characters.attach([tanjiro, nezuko, shinobu], on: database)
        try await episode005.$characters.attach([tanjiro, nezuko, shinobu], on: database)
        try await episode006.$characters.attach([tanjiro, nezuko, inosuke, sanemi], on: database)
        try await episode007.$characters.attach([tanjiro, nezuko, inosuke, zenitsu, sanemi], on: database)
        try await episode008.$characters.attach([tanjiro, nezuko, inosuke, sanemi], on: database)
        try await episode009.$characters.attach([tanjiro, nezuko, inosuke, sanemi, kanao], on: database)
        try await episode010.$characters.attach([tanjiro, nezuko, inosuke, zenitsu, muzan, gyomei], on: database)

    }
    
    func revert(on database: Database) async throws {
        try await News.query(on: database).delete()
        try await Character.query(on: database).delete()
        try await Episode.query(on: database).delete()
        try await EpisodeCharacterPivot.query(on: database).delete()
    }
}
