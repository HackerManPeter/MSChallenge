import { IsNumber, IsOptional, IsString } from 'class-validator';

export class UpdateBookDto {
  @IsString()
  @IsOptional()
  book_title: string;

  @IsString()
  @IsOptional()
  book_edition: string;

  @IsString()
  @IsOptional()
  book_author: string;

  @IsString()
  @IsOptional()
  book_publisher: string;

  @IsNumber()
  @IsOptional()
  book_copies: number;

  @IsNumber()
  @IsOptional()
  book_cost: number;

  @IsString()
  @IsOptional()
  book_remarks: string;
}
