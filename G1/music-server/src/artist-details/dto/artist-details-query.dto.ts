import { IsOptional, IsString, IsInt, Min, IsBoolean } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';

export class ArtistDetailsQueryDto {
  @IsOptional()
  @IsString()
  @ApiProperty({
    required: false,
    description: 'Search term to look for in full names',
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
  @IsString()
  @ApiProperty({
    required: false,
    description: 'Filter by country of the artist',
  })
  country?: string;

  @IsOptional()
  @IsBoolean()
  @Type(() => Boolean)
  @ApiProperty({
    required: false,
    description: 'Filter by marital status',
    example: 'true',
  })
  is_married?: string;
}
