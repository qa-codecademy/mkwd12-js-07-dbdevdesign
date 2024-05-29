import { IsOptional, IsString, IsInt, Min } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';

export class AlbumsQueryDto {
  @IsOptional()
  @IsString()
  @ApiProperty({
    required: false,
    description: 'Search term to look for in album names',
  })
  search?: string;

  @IsOptional()
  @IsInt()
  @Min(0)
  @Type(() => Number)
  @ApiProperty({
    required: false,
    description: 'Number of items to skip',
    default: 0,
  })
  skip?: number = 0;

  @IsOptional()
  @IsInt()
  @Min(1)
  @Type(() => Number)
  @ApiProperty({
    required: false,
    description: 'Number of items to take',
    default: 10,
  })
  take?: number = 10;

  @IsOptional()
  @IsInt()
  @Min(1)
  @Type(() => Number)
  @ApiProperty({
    required: false,
    description: 'Rating of the album',
    default: 10,
  })
  rating?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  @Type(() => Number)
  @ApiProperty({
    required: false,
    description: 'Id of the artist',
    default: 10,
  })
  artistId?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  @Type(() => Number)
  @ApiProperty({
    required: false,
    description: 'Id of the song',
    default: 10,
  })
  songId?: number;
}
