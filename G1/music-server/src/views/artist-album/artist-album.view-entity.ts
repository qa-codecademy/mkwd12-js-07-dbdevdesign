import { ViewColumn, ViewEntity } from 'typeorm';

@ViewEntity({
  name: 'artist_album_view',
  expression: `
    SELECT
      a.id AS artist_id,
      a.name AS artist_name,
      ad.date_of_birth AS date_of_birth,
      ad.full_name AS full_name,
      al.name AS album_name,
      al.rating AS album_rating
    FROM artist a
    JOIN artist_details ad ON a.id = ad.artist_id
    JOIN album al ON al.id = (SELECT album.id
                              FROM album
                              JOIN song s ON album.id = s.album_id
                              WHERE s.artist_id = a.id
                              LIMIT 1)
  `,
})
export class ArtistAlbumView {
  @ViewColumn()
  artist_id: number;

  @ViewColumn()
  artist_name: string;

  @ViewColumn()
  date_of_birth: Date;

  @ViewColumn()
  full_name: string;

  @ViewColumn()
  album_name: string;

  @ViewColumn()
  album_rating: number;
}
