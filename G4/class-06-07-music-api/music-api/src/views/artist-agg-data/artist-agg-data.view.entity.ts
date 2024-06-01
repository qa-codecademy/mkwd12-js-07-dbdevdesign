import { ViewColumn, ViewEntity } from 'typeorm';

@ViewEntity({
  name: 'vw_artist_agg_data',
  expression: `
        select * from vw_artist_agg_data
    `,
})
export class ArtistAggDataView {
  @ViewColumn()
  artist_name: string;

  @ViewColumn()
  song_count: number;

  @ViewColumn()
  total_duration: string;
}
